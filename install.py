#!/usr/bin/env python
import os
import sys

DEFAULT = os.path.abspath('default')
DESKTOP = 'desktop'
HOME = os.getenv('HOME')


def link_default():
    ''' Default terminal configuration files '''
    for file in os.listdir(DEFAULT):
        source = os.path.join(DEFAULT, file)
        dest = os.path.join(HOME, '.%s' % file)
        print 'Symlink to .%s' % file
        try:
            if os.path.exists(dest):
                os.unlink(dest)
            os.symlink(source, dest)
        except OSError:
            continue


def link_desktop():
    for dirname, dirnames, filenames in os.walk(DESKTOP):
        for file in filenames:
            source = os.path.join(dirname, file)
            source = os.path.abspath(source)
            if 'config' in source:
                dest_path = os.path.join(HOME, '.%s' % dirname.replace('desktop/', ''))
                if not os.path.exists(dest_path):
                    os.makedirs(dest_path)
                dest = os.path.join(dest_path, file)
            else:
                dest = os.path.join(HOME, '.%s' % file)
            print 'Linking %s' % file

            try:
                os.symlink(source, dest)
            except OSError:
                continue


if  __name__ == '__main__':
    PATH = os.path.join(os.environ.get('HOME'), '.vimswp')
    print("Creating .vimswp directory")
    try:
        os.mkdir(PATH)
    except:
        pass
    if len(sys.argv) > 1 and sys.argv[1] == 'desktop':
        link_desktop()
    else:
        link_default()
