#!/usr/bin/env python

from lxml.cssselect import CSSSelector
import lxml.html
import requests
import subprocess
import sys
import re
import os


def get(url=None):
    cmd = ['wget', url]
    pwd = os.getenv('PWD')

    if not os.path.exists(os.path.join(pwd, 'videos')):
        os.mkdir('videos')

    if not 'videos' in pwd:
        os.chdir(os.path.join(pwd, 'videos'))

    subprocess.Popen(cmd, stdout=open('/dev/null', 'w'), stderr=open('/dev/null', 'w'))


def download_videos(url=None):
    print 'Downloading videos from %s\n' % url
    r = requests.get(url)
    dom = lxml.html.fromstring(r.text)
    selector = CSSSelector('a')
    elements = selector(dom)
    for video in [e.get('href') for e in elements if re.search('^http.*\.mp4', e.get('href'))]:
        print 'Downloading: %s\n' % video
        get(video)


if __name__ == '__main__':
    if len(sys.argv) > 1:
        download_videos(sys.argv[1])
    else:
        print 'Provide at least one url'
        sys.exit(1)
