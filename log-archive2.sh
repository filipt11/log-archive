#!/bin/bash

directory="$1"

#checking if provided arguments are correct

if [ $# -eq 0 ]; then
	echo "specify the directory to zip"
	exit 1
elif [ $# -gt 1 ]; then
	echo "too many arguments"
	exit 1
fi
if [ ! -d "$directory" ]; then
	echo "there is no such a directory"
	exit 1
fi

#checking if directory for logs exists, if not createing it in home directory
path=~/logs
mkdir -p "$path"

#extracting current date
current_date=$(date +"%Y%m%d_%H%M%S")

main(){
	#archiving files
	tar -cvzf "$path"/logs_archive_"$current_date".tar.gz "$directory"
}
main

