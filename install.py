#!/usr/bin/env python
import os
import sys
import argparse 

DEFAULT = os.path.abspath('default')
DESKTOP = 'desktop'
HOME = os.getenv('HOME')


def link_default():
    ''' Default terminal configuration files '''
    for file in os.listdir(DEFAULT):
        source = os.path.join(DEFAULT, file)
        dest = os.path.join(HOME, '.%s' % file)
        print(f'Symlink to {file}')
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
            print(f'Linking {file}')

            try:
                os.symlink(source, dest)
            except OSError:
                continue


if  __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Install dotfiles in linux or mac')
    parser.add_argument('-t', '--target',  help='target platform', required=True)
    args = parser.parse_args()
    target_os = args.target

    if 'linux' in target_os:
        if 'linux' in sys.platform:
         link_default()
         link_desktop() 
         sys.exit(0)
        else:
            print('Not a linux system')
    elif 'osx' in target_os:
       print('implement')
       pass
    else:
        print('target system not supported.')