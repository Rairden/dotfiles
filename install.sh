#!/bin/bash

# git clone https://gitlab.com/Rairden/dotfiles.git
# I place all my dotfiles here in dir ~/.dotfiles/

dir=/home/"$USER"/.config/alacritty

if [ ! -d "$dir" ]; then
  mkdir "$dir"
fi

if [ ! -L ~/.vimrc ]; then
    ln -s /home/"$USER"/.dotfiles/.vimrc        /home/"$USER"/.vimrc
    echo "Symlink created:  /home/$USER/.vimrc"
fi

if [ ! -L ~/.zshrc ]; then
    ln -s /home/"$USER"/.dotfiles/.vimrc        /home/"$USER"/.zshrc
    echo "Symlink created:  /home/$USER/.zshrc"
fi

if [ ! -L ~/.tmux.conf ]; then
    ln -s /home/"$USER"/.dotfiles/.tmux.conf    /home/"$USER"/.tmux.conf
    echo "Symlink created:  /home/$USER/.tmux.conf"
fi

if [ ! -L ~/.config/alacritty/alacritty.yml ]; then
    ln -s /home/"$USER"/.dotfiles/alacritty.yml     /home/"$USER"/.config/alacritty/alacritty.yml
    echo "Symlink created:  /home/$USER/.config/alacritty/alacritty.yml"
fi

if [ ! -L /root/.vimrc ]; then
    ln -s /home/"$USER"/.dotfiles/.vimrc        /root/.vimrc
    echo "Symlink created:  /root/.vimrc"
fi

if [ ! -L /root/.zshrc ]; then
    ln -s /home/"$USER"/.dotfiles/.zshrc        /root/.zshrc
    echo "Symlink created:  /root/.zshrc"
fi

if [ ! -L /root/.tmux.conf ]; then
    ln -s /home/"$USER"/.dotfiles/.tmux.conf    /root/.tmux.conf
    echo "Symlink created:  /root/.tmux.conf"
fi

# Make a global gitignore
if ! git config --get core.excludesfile; then
    git config --global core.excludesfile ~/.dotfiles/.gitignore_global
    git config --get core.excludesfile
fi

