#!/bin/bash

LSB="/etc/lsb-release" 
RELEASE=$(test -e $LSB && sed -ne 's/DISTRIB_CODENAME=\(.*\)/\1/gp' $LSB)
TMP='/tmp/puppet'

[[ -n "$RELEASE" ]] && (test -d $TMP-$RELEASE || mkdir -p $TMP-$RELEASE) || (echo "This is not an Ubuntu system based" && exit 1 )


download() {
	if [ -e  "$TMP-$RELEASE" ];then
		cd "$TMP-$RELEASE"
		wget http://apt.puppetlabs.com/puppetlabs-release-$RELEASE.deb
		sudo dpkg -i puppetlabs-release-precise.deb
		sudo aptitude update
		sudo aptitude install puppet -y
	fi
}

clean_up() {
	local default="Download canceled, removing files"
	echo "${1:-$default}"
	rm -rf $TMP-$RELEASE
}

trap clean_up SIGINT

[[ -n "$RELEASE" ]] && download  && clean_up "Installation finished"
