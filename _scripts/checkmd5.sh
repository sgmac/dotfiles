#!/bin/bash

if [ $#  -lt 2 ];then
	echo "basename($0)"
	exit
fi


get_md5(){
    md5=$(md5sum "$1" | cut -d" " -f1 )
    echo $md5
}
LAST_MD5=$(get_md5 "$1")
CURRENT_MD5=$(get_md5 "$2")
if [ $LAST_MD5 == $CURRENT_MD5 ];then
       echo "Same file"	
fi
