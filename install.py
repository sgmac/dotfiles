#!/usr/bin/env python
import os


DEFAULT = os.path.abspath('default')

HOME = os.getent('HOME')


def link_default():
    ''' Default terminal configuration files '''
    for file in os.listdir(DEFAULT):
        source = os.path.join(DEFAULT, file)
        dest = os.path.join(HOME, '.%s' % file)
        print 'Symlink to .%s' % file
        os.symlink(source, dest)


if  __name__ == '__main__':
    print 'Installing dotfiles\n'
    link_default()
