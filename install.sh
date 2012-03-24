#!/bin/bash

current_dir=$(dirname $(readlink -f $0) )
backup_dir="${HOME}/.backdots"
dest="$HOME"

function set_msg() {

	local default="33"
	local color=${1:-$default}
	local msg="$2"
	local params="$3"
	echo -ne "\033[1;3${color}m\t"; printf ' %s'  $msg 
	printf '\n'
}


function set_done() {
	printf '\033[1;32m\t........[done]\n' 
}

function set_dots() {
    	printf '\033[1;34m [*] Configuration for %s' $*
    	set_$*  "$*"
}

function set_vim() {

	set_done    "$1"
	check_dest  "$1"
	set_link    "$1"

}

function set_scripts() {
	
 	set_done    "$1"
	check_dest  "$1"
	set_link    "$1"

}

function set_bash() {

	set_done   "$1"
	check_dest "$1"
	set_link   "$1"

}

function set_ruby() {

        set_done   "$1"
	check_dest "$1"
	set_link   "$1"

}

function set_emacs() {

	set_done   "$1"
	check_dest "$1"
	set_link   "$1"
}

function set_tools() {

	set_done   "$1"
	set_link   "$1"
}


function set_link() {
	
	local orig="$current_dir"
	local dest="$dest"
	local dir="$1"
	
	case $dir in
		bash|ruby|tools)
			printf "\tSetting links for %s \n" $dir
			set_msg "7" "ln -s ${dir}"
			set_link_all "$dir"
			;;
		vim)
			cd $dest &&  git clone git://github.com/rodjek/vim-puppet.git ".${dir}" >& /dev/null

			if [ $? -ne 0 ]; then
				set_msg "7" "rsync ${dir}"
			       	rsync -avz ${current_dir}/_$dir ${dest}/.${dir} >& /dev/null
			fi

			if [ "${dest}/.${dir}rc" ];then
				do_backup "${dest}/.${dir}rc" && ln -s "${orig}/_${dir}/_${dir}rc" "${dest}/.${dir}rc"
			fi
			;;
		emacs)
			printf  "\tSetting link for emacs\n"
			set_msg "7" "ln -s ${dir}"
			ln -s "${orig}/_${dir}" "${dest}/.${dir}.d"
			;;
		scripts)
			printf "\tSetting links for scripts\n" 
			set_msg "7" "ln -s ${dir}"
			ln -s "${orig}/_${dir}" "${dest}/.${dir}"
			;;
		*)
			echo "Default"
			;;
	esac

}


function set_link_all() {

	local dir="$1"
	for file in $(ls "${current_dir}/_${dir}" | sed -e 's/_/\./');
	do
	        check_dest "${file#.}" 
		ln -s "${orig}/_${dir}/_${file#.}"  "${dest}/$file"  2>/dev/null
		set_msg "7" "ln -s ${file}"
	done
}

function check_dest() {

	local dest="${dest}/.${1}"
	if [ -e "$dest" ];then
		if [ ! -L "$dest" ];then
			do_backup "$dest"
		
		else
			unlink "$dest"		
		fi

	fi
}

function do_backup() {

	local keep="$1" 
	local timestamp=$(date +%s)
	
	test  -d "$backup_dir" || mkdir -p "$backup_dir"

	if [ -f "${keep}" ];then
		mv $keep ${backup_dir}/${keep#*.}-${timestamp}
	else
		mv $keep ${backup_dir}/${keep##*.}-${timestamp}
	fi

	set_msg "0" "- Backup " "${keep##*/}"
}

function get_dots() {
	
	files="${current_dir}/_*"
        
        printf '\n'	
        for dot in $files;do
	  set_dots  "${dot#*_}"
	done
	printf '\n'
}

get_dots  &&  [ "${SHELL##*/}" == "bash" ] && exec ${SHELL##*/}


