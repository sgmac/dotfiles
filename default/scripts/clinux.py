#!/usr/bin/env python
import optparse
import sys


def show_rpm():
    print '''
        $ rpm <options> [package]
        Querying(-q):
            -qa                 List all packages (installed)
            -qf  file           What package does that file belong to?
            -qp  package.rpm    Query a package, needs more options
                 -i,--info      Info about the package
                 -l,--list      Contents of a pacakge
                 -d             Only documentation
            -q   -r,--requieres What requires a package. It must be installed.
            -vK  package.rpm    Verify sign of a package.
            -V   package_name   Verify integrity of the provided files. (touch /usr/sbin/tcpdump should raise )
            -q --whatprovides   What package provides a file. ($ rpm -q --whatprovides $(which yumdownloader)
                                                                yum-utils-1.1.30-14.el6.noarch)

        Installing(-i):
            -ivh package.rpm    Install package.rpm (v/verbose h/hash, shows a bar)
            -Uvh package.prm    Upgrade a package or installs if was not already installed.
            -Fvh package        Fresh a package, upgrades only if it's already installed.

        Removing(-e):
            -e   package        Remove package

    '''


def show_dpkg():
    print '''
        $ dpkg <options> [package]
        Querying:
            -l  package         Show status of a package. (Must be already installed)
            -L  package         List files of a package.
            -s  package         Show decription of the package. (same as aptitude show )
            -S  `which file`    Show the package name where the file belongs to.
            --info *.deb        Show decription of the package. (same as aptitude show )
            -c, --contents      List the contents of the package. (.deb)

        Installing:
            -i package.deb      Install package
            -r --remove         Remove  package
            -x                  Extract the content of a package
    '''


if __name__ == '__main__':

    parser = optparse.OptionParser("usage: %prog [options]")
    parser.add_option("-r", "--redhat", action="store_true", dest="redhat", default=False, help="show rpm options")
    parser.add_option("-d", "--debian", action="store_true", dest="debian", default=False, help="show dpkg options")
    (options, args) = parser.parse_args()
    if len(sys.argv) < 2:
        parser.print_help()
    if options.redhat is True:
        show_rpm()
    if options.debian is True:
        show_dpkg()
