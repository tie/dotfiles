import sys

if sys.version_info.major >= 3:
	from urllib.request import urlopen as open
	from urllib.request import urlretrieve as retrieve
else:
	from urllib import urlretrieve as retrieve
	from urllib2 import urlopen as open
