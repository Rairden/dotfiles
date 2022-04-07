#!/bin/bash

# I place all my dotfiles at ~/.dotfiles
# Run this script as sudo
# 	git clone https://gitlab.com/Rairden/dotfiles.git
#	cd dotfiles && sudo ./install.sh

mklink() {
	file=$1
	cd /home/erik || exit 1
	pwd
	for file in "$@"; do
		rm -f "$file"
		ln -s "$dotfiles/$file" .
		ls -la --color "$file" 2> /dev/null
	done

	cd /root || exit 1
	pwd
	for file in "$@"; do
		rm -f "$file"
		ln -s "$dotfiles/$file" .
		ls -la --color "$file" 2> /dev/null
	done

	ln -s /home/erik/.vim . 2> /dev/null
	ls -la --color /root/.vim 2> /dev/null
}

installJumpAround() {
	rm -f "$home"/z.sh
	wget -P "$home" https://raw.githubusercontent.com/rupa/z/master/z.sh 2> /dev/null
	chmod 755 "$home"/z.sh
}

if [ "$EUID" -ne 0 ]; then
	echo "This script must be run as root. Use sudo $0 instead"
	exit 1
fi

home=/home/erik
dotfiles=$home/.dotfiles
cd "$(git rev-parse --show-toplevel)" || exit 1
installJumpAround

if [ -d "$dotfiles" ]; then
	read -p "$dotfiles directory already exists. Delete it? [y,Y] " reply
	[[ ! $reply =~ [yY] ]] && echo "exiting" && exit 1
fi

echo -e "\nbacking up $dotfiles to /tmp"
echo -e "[CMD] rsync -a $dotfiles /tmp &> /dev/null\n"
rsync -a "$PWD" /tmp &> /dev/null

rm -rf "$dotfiles"
mv "$PWD" "$dotfiles"

mklink .bashrc .tmux.conf .gitconfig .vimrc .zshrc
