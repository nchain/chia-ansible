#!/bin/bash
# Decription: backup package
# Version: 0.1.0
# Date: 2019-05-22
#


if [ $# -lt 2 ];then
	echo "Error: $(basename $0) BASE_DIR proj_name"
	exit 2
fi

backup_count=3
backup_dir=$1
backup_name=$2
backup_path=$backup_dir/$backup_name

mkdir -p $backup_path

if ! ls -d $backup_path &>/dev/null ;then
	echo "can't find backup directory $backup_path or file . "
	exit 2
fi

clear_backup() {
	cd $backup_dir
	if ! ls $(basename $backup_path)_* &> /dev/null ;then
		return 0
	fi
	for name in $(ls -d ${backup_path}_* -rt | sed -n "$backup_count,\$p");do
		rm -rf $name
	done
}


backup() {
	mv $backup_path $backup_dir/${backup_name}_$(date '+%F_%H-%M-%S')
}

clear_backup
backup