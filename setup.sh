#/bin/bash

# 環境のsetupを行うスクリプト
# コンフィグの設定は任意

set -eu
wd=$(dirname $0)
cd $wd

ask_become_pass="--ask-become-pass"
interactive="true"
modify_config=""
force_install=false
for OPT in "$@"
do
	case $OPT in
		--modify-config)
			modify_config="$2"
			shift 2;;
		--no-interactive)
			ask_become_pass=""
			interactive="false"
			shift 1;;
		--force-install)
			force_install=true
			shift 1;;
	esac

done
skip_tags=''
if [ -z "$modify_config" ];then
	if [ "$interactive" = "false" ]; then
		modify_config="Yes"
		skip_tags="$skip_tags --skip-tags require_google_auth"
	else
		echo "各種configの設定をしますか？この変更はユーザー設定を変更します。"
		echo -n "Y[es]/n[o]:"
		read modify_config
		echo "Google Accountは発行されていますか?"
		echo -n "Y[es]/n[o]:"
		read require_google_auth_yesno
		case $require_google_auth_yesno in
			Y|Yes);;
			*)skip_tags="$skip_tags --skip-tags require_google_auth";;
		esac
	fi
fi


set_config=false

case $modify_config in
	Y|Yes) echo "configの設定を行います"
		set_config=true;;

	*) echo "configの設定をキャンセルしました"
		set_config=false;;

esac

if [ "$(uname)" = "Darwin" ] && ! command -v brew 2>&1; then
	echo "brewをインストール"
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "ansibleをインストール"
if [ "$(uname)" = "Darwin" ]; then
	rm '/usr/local/bin/2to3' || true
	brew update
	brew install ansible
elif command -v apt 2>&1; then
	sudo apt update
	sudo apt install -y ansible
else
	echo "対応していない環境です"
	exit 1
fi

ansible-galaxy install markosamuli.asdf

echo "必要なツールをインストールします。管理者権限が必要です"
ansible-playbook ansible/setup.yaml --ask-become-pass --extra-vars="set_config=$set_config force_install=$force_install" $skip_tags

echo "インストールが完了しました。設定を反映するために再起動を行ってください"
