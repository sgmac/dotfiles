#!/bin/bash
# Define days of month
declare -A cal
cal[1]=31
cal[2]=28
cal[3]=31
cal[4]=30
cal[5]=31
cal[6]=30
cal[7]=31
cal[8]=31
cal[9]=30
cal[10]=31
cal[11]=30
cal[12]=31

get_md5(){
    md5=$(md5sum "$1" | cut -d" " -f1 )
    echo $md5
}

# Check  date of the precious backup
WIKI_PATH="/var/www/wiki/data"
DAY_BEFORE=$(($(date +%d)-1))

if [ $DAY_BEFORE -lt 10 ];then
	DAY_BEFORE="0${DAY_BEFORE}"
fi


MONTH_BEFORE=$(($(date +%m)-1))
BACKUP_WIKI=wiki-data-`date +%d-%m-%Y`.tar.gz

if [ $DAY_BEFORE -ne 1 ];then
	LAST_BACKUP=wiki-data-${DAY_BEFORE}-`date +%m-%Y`.tar.gz
else
	# Review code, something failed on 1th Jan
	if [ $MONTH_BEFORE -eq 0 ];then
		$MONTH_BEFORE=12
	fi
	LAST_BACKUP=wiki-data-${cal[$MONTH_BEFORE]}-$MONTH_BEFORE-$(date +%Y).tar.gz
fi

LAST_MD5=$(get_md5 "/tmp/$LAST_BACKUP")

# Tar the data
tar czPf /tmp/${BACKUP_WIKI} --exclude ${WIKI_PATH}/cache  ${WIKI_PATH}

# Upload backup
if [ "$LAST_MD5" != "$CURRENT_MD5" ];then
	s3cmd put  /tmp/${BACKUP_WIKI} s3://idunwikibackup
fi
if [ $? -eq 0 ];then
	logger -p local7.info "Sending  ${BACKUP_WIKI} to s3://idunwikibackup"
else
	logger -p local7.info "Error $?: sending backup "
fi


