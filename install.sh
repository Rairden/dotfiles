#! /usr/bin/env bash

dir1=/home/$USER/.config/alacritty

if [ ! -d $dir1 ]; then
  mkdir $dir1
fi

ln -s /home/$USER/.dotfiles/.vimrc          /home/$USER/.vimrc
ln -s /home/$USER/.dotfiles/.zshrc          /home/$USER/.zshrc
ln -s /home/$USER/.dotfiles/.tmux.conf      /home/$USER/.tmux.conf
ln -s /home/$USER/.dotfiles/alacritty.yml   /home/$USER/.config/alacritty/alacritty.yml

ln -s /home/$USER/.dotfiles/.vimrc          /root/.vimrc
ln -s /home/$USER/.dotfiles/.zshrc          /root/.zshrc
ln -s /home/$USER/.dotfiles/.tmux.conf      /root/.tmux.conf

