import sys

if sys.version_info.major >= 3:
	from xml.etree import ElementTree as ET
else:
	from xml.etree import cElementTree as ET

def parse(*args, **kwargs):
	return ET.parse(*args, **kwargs)
