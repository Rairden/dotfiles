#! /usr/bin/env bash

cd /home/$USER
ln -s .dotfiles/.vimrc /home/$USER/.vimrc
ln -s .dotfiles/.zshrc /home/$USER/.zshrc

cd /root
ln -s /home/$USER/.dotfiles/.vimrc /root/.vimrc
ln -s /home/$USER/.dotfiles/.zshrc /root/.zshrc
