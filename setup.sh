#/bin/bash

set -eu

if [ "$(uname)" = "Darwin" ] && [ "$(command -v brew)" = "" ]; then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if [ "$(command -v apt)" != "" ]; then
	sudo apt install ansible
elif [ "$(uname)" = "Darwin" ]; then
	brew install ansible
fi
