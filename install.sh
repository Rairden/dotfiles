#!/bin/bash

# I place all my dotfiles ~/.dotfiles

dotfiles=/home/"$USER"/.dotfiles

mv ../dotfiles ../.dotfiles

if [ ! -L ~/.gitconfig ]; then
    ln -s "$dotfiles"/.gitconfig /home/"$USER"/.gitconfig
    echo "Symlink created:  /home/$USER/.gitconfig"
fi

if [ ! -L ~/.vimrc ]; then
    ln -s "$dotfiles"/.vimrc /home/"$USER"/.vimrc
    echo "Symlink created:  /home/$USER/.vimrc"
fi

if [ ! -L ~/.zshrc ]; then
    ln -s "$dotfiles"/.zshrc /home/"$USER"/.zshrc
    echo "Symlink created:  /home/$USER/.zshrc"
fi

if [ ! -L ~/.tmux.conf ]; then
    ln -s "$dotfiles"/.tmux.conf /home/"$USER"/.tmux.conf
    echo "Symlink created:  /home/$USER/.tmux.conf"
fi

if [ ! -L /root/.vimrc ]; then
    ln -s "$dotfiles"/.vimrc /root/.vimrc
    echo "Symlink created:  /root/.vimrc"
fi

if [ ! -L /root/.zshrc ]; then
    ln -s "$dotfiles"/.zshrc /root/.zshrc
    echo "Symlink created:  /root/.zshrc"
fi

if [ ! -L /root/.tmux.conf ]; then
    ln -s "$dotfiles"/.tmux.conf /root/.tmux.conf
    echo "Symlink created:  /root/.tmux.conf"
fi

# todo: Fix all root folders above. It dumps to /root/home/.dotfiles
#   root has missing vimrc colors. Make symlink; this fixed it as root ran in /root:
#   ln -s /home/erik/.vim .
