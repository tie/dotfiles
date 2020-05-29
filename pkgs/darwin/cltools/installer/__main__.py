#!/usr/bin/env python

import atexit
import contextlib
import gzip
import hashlib
import io
import os
import shutil
import subprocess
import tempfile

import plist
import url
import etree

from eprint import eprint

packages = {
	'com.apple.pkg.CLTools_SDK_macOS1014': '8ee684b2f111dd62334759b7f092a68dc024adf9496d2fd4cee9906585b6911d',
	'com.apple.pkg.CLTools_SDK_macOS1015': '440ae3614aa2d9657c22a3c2dedfc4804008be22dd48cacdd141c9d544c487fc',
	'com.apple.pkg.CLTools_macOS_SDK': 'e437dfe2d09a186390dd5d5515ebf25292b55ef17fc9a26dc1eda635456a0937',
	'com.apple.pkg.CLTools_Executables': '4a31923d3b763466353edbe49b2b3af1285ba8c2f3cce2248b26d88116b38935',
}

def sha256(fname, bs=4096):
	h = hashlib.sha256()
	with open(fname, "rb") as f:
		for chunk in iter(lambda: f.read(bs), b""):
			h.update(chunk)
	return h.hexdigest()

def main():
	relDest = os.path.join('~', 'opt', 'cltools')
	dest = os.path.expanduser(relDest)
	if os.path.exists(dest):
		eprint('path {} already exists'.format(relDest))
		exit(1)

	temp = None
	def cleanup():
		if temp is None:
			return
		shutil.rmtree(temp)
	atexit.register(cleanup)

	temp = tempfile.mkdtemp('dotfiles')

	tempDest = os.path.join(temp, 'target')
	os.mkdir(tempDest)

	sucatalog = 'https://swscan.apple.com/content/catalogs/others/index-10.15-1.sucatalog.gz'
	with contextlib.closing(url.open(sucatalog)) as resp:
		bio = io.BytesIO(resp.read())
		gfile = gzip.GzipFile(fileobj=bio)
		props = plist.parse(gfile)

	cltools = props.get('Products', {}).get('061-26566', {}).get('Packages')
	if cltools is None:
		eprint('could not find cltools packages in sucatalog')
		exit(1)

	for pkg in cltools:
		pkgURL = pkg.get('URL')
		if not isinstance(pkgURL, str):
			eprint('missing URL in {}'.format(pkg))
			continue
		metaURL = pkg.get('MetadataURL')
		if not isinstance(metaURL, str):
			eprint('missing MetadataURL in {}'.format(pkg))
			continue

		pkgID, pkgSum = '', ''
		with contextlib.closing(url.open(metaURL)) as resp:
			tree = etree.parse(resp)
			root = tree.getroot()
			pkgID = root.attrib.get('identifier')
			if pkgID not in packages:
				continue
			pkgSum = packages[pkgID]

		http = 'http://swcdn.apple.com/'
		if pkgURL.startswith(http):
			https = 'https://swdist.apple.com/'
			pkgURL = pkgURL.replace(http, https)

		lastID = pkgID.split('.')[-1]

		fname = '{}.pkg'.format(lastID)
		fpath = os.path.join(temp, fname)
		url.retrieve(pkgURL, fpath)

		if pkgSum != sha256(fpath):
			eprint('checksum mismatch for {}', pkgID)
			exit(1)

		outDir = os.path.join(temp, lastID)
		os.mkdir(outDir)

		rc = subprocess.call(
			['xar', '-x', '-f', fpath],
			cwd=outDir,
		)
		if rc != 0:
			eprint('got non-zero exit code from xar')
			exit(1)

		pbzx = subprocess.Popen(
			['pbzx', '-n', 'Payload'],
			stdout=subprocess.PIPE,
			cwd=outDir,
		)
		cpio = subprocess.Popen(
			['cpio', '--quiet', '-m', '-i'],
			stdin=pbzx.stdout,
			cwd=tempDest,
		)
		failed = []
		if pbzx.wait() != 0:
			cpio.terminate()
			failed += ['pbzx']
		if cpio.wait() != 0:
			failed += ['cpio']
		if len(failed) > 0:
			f = 'and'.join(failed)
			eprint('got non-zero exit code from {}'.format(f))
			exit(1)

	os.rename(tempDest, dest)

if __name__ == '__main__':
	main()
