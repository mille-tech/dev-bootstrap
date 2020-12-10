#/bin/bash

set -eu
wd=$(dirname $0)
cd $wd

if [ "$(uname)" = "Darwin" ] && ! command -v brew 2>&1; then
	echo "brewをインストール"
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "ansibleをインストール"
if command -v apt 2>&1; then
	sudo apt install ansible
elif command -v brew 2>&1; then
	brew install ansible
else
	echo "対応していない環境です"
	exit 1
fi

ansible-galaxy install markosamuli.asdf

echo "必要なツールをインストールします。管理者権限が必要です"
ansible-playbook ansible/install.yaml --ask-become-pass



echo "各種configの設定をしますか？この変更はユーザー設定を変更します。"
echo -n "Y[es]/n[o]"
read modify_config


case $modify_config in
	Y|Yes) echo "configの設定を行います"
		ansible-playbook ansible/config.yaml --ask-become-pass ;;

	*) echo "configの設定をキャンセルしました" ;;

esac
