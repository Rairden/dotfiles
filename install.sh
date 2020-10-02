#!/bin/bash

# git clone https://gitlab.com/Rairden/dotfiles.git
# I place all my dotfiles here in dir ~/.dotfiles/

dir=/home/"$USER"/.config/alacritty
dotfiles=/home/"$USER"/.dotfiles

if [ ! -d "$dotfiles" ]; then
    git clone https://gitlab.com/Rairden/dotfiles.git "$dotfiles"
fi

if [ ! -d "$dir" ]; then
    mkdir "$dir"
fi

if [ ! -L ~/.gitconfig ]; then
    ln -s "$dotfiles"/.gitconfig    /home/"$USER"/.gitconfig
    echo "Symlink created:  /home/$USER/.gitconfig"
fi

if [ ! -L ~/.vimrc ]; then
    ln -s "$dotfiles"/.vimrc        /home/"$USER"/.vimrc
    echo "Symlink created:  /home/$USER/.vimrc"
fi

if [ ! -L ~/.zshrc ]; then
    ln -s "$dotfiles"/.zshrc        /home/"$USER"/.zshrc
    echo "Symlink created:  /home/$USER/.zshrc"
fi

if [ ! -L ~/.tmux.conf ]; then
    ln -s "$dotfiles"/.tmux.conf    /home/"$USER"/.tmux.conf
    echo "Symlink created:  /home/$USER/.tmux.conf"
fi

if [ ! -L ~/.config/alacritty/alacritty.yml ]; then
    ln -s "$dotfiles"/alacritty.yml     /home/"$USER"/.config/alacritty/alacritty.yml
    echo "Symlink created:  /home/$USER/.config/alacritty/alacritty.yml"
fi

if [ ! -L /root/.vimrc ]; then
    ln -s "$dotfiles"/.vimrc        /root/.vimrc
    echo "Symlink created:  /root/.vimrc"
fi

if [ ! -L /root/.zshrc ]; then
    ln -s "$dotfiles"/.zshrc        /root/.zshrc
    echo "Symlink created:  /root/.zshrc"
fi

if [ ! -L /root/.tmux.conf ]; then
    ln -s "$dotfiles"/.tmux.conf    /root/.tmux.conf
    echo "Symlink created:  /root/.tmux.conf"
fi

# Make a global gitignore
# if ! git config --get core.excludesfile; then
#     git config --global core.excludesfile ~/.dotfiles/.gitignore_global
#     git config --get core.excludesfile
# fi

