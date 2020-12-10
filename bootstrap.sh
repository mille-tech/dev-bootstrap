#!/bin/bash

set -eu
extract_dir=$(mktemp -u)
zip_file=$(mktemp -u)


trap "
	rm $zip_file
	rm -rf $extract_dir
" 1 2 3 9 15 0

#TODO 正式なレポジトリができたら変更する
author="qwerty2501"
repo_name="working-environment-bootstrap"
repo_url="https://github.com/$author/$repo_name/archive/master.zip"
wd="$extract_dir/$repo_name-master"
if command -v curl > /dev/null 2>&1; then
	curl -L --output $zip_file $repo_url
elif command -v wget > /dev/null 2>&1; then
	wget -O $zip_file $repo_url
else 
	echo "環境構築にはcurlかwgetが必要です"
	exit 1
fi

unzip -d $extract_dir $zip_file

bash $wd/setup.sh

