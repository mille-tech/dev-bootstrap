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
ansible-playbook ansible/setup.yaml --ask-become-pass
