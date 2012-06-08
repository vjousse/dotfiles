#!/usr/bin/python
# -*- coding: utf-8 -*-
''' Simple url downloader for ATP'''
import sys
if sys.version_info < (3, 0):
    # Python 2.7 code:
    import sys, urllib2, tempfile

    url  = sys.argv[1]
    tmpf = sys.argv[2]

    try:
        f    = open(tmpf, "w")
    except IOError as e:
        print(str(e))
    else:
        data = urllib2.urlopen(url)
        f.write(data.read())
    finally:
        f.close()
else:
    # Python3 code:
    import urllib.request, urllib.error, urllib.parse

    url  = sys.argv[1]
    tmpf = sys.argv[2]

    data = urllib.request.urlretrieve(url,tmpf)
