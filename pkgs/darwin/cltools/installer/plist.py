import sys

if sys.version_info.major >= 3:
	from plistlib import load as readPlist
else:
	from plistlib import readPlist

def parse(*args, **kwargs):
	return readPlist(*args, **kwargs)
