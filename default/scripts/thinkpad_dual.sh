#!/bin/bash


if [ $# -lt 1 ];then
	echo "`basename $0`: enable or disable"
	exit 1
fi

OPTION=$1

case $OPTION in
	activate)
		xrandr --output DP1 --auto --output VGA1 --auto --right-of DP1
		xrandr --output LVDS1 --off
		;;
	deactivate)
		xrandr --output VGA1 --off
		xrandr --output LVDS1 --auto
		xrandr --output DP1 --off
		;;
	*)
		echo "Unknown option"
		exit 1
		;;
esac
