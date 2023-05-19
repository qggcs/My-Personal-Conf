#!/bin/sh
green='\033[1;32m'
red='\033[1;31m'
nc='\033[0m'

backup_dir=${1:-$(pwd)}

read -p "Backup to $backup_dir? [y/n] " c

if [ "$c" != "y" ]; then
    echo "${red}Backup aborted${nc}"
    exit 1
fi

if [ ! -d $backup_dir ]; then
    echo "${red}Dir $backup_dir does not exist${nc}"
    exit 1
fi

echo "Backup start..."

cp $HOME/.vimrc $backup_dir
cp $HOME/.ideavimrc $backup_dir
cp $HOME/.zshrc $backup_dir
cp $HOME/.gitconfig $backup_dir
cp $HOME/.ssh/config $backup_dir/.ssh/
cp -r $HOME/.config/alacritty $backup_dir/.config
cp -r $HOME/.config/zsh $backup_dir/.config
cp -r $HOME/.config/tmux $backup_dir/.config

echo "${green}Finished${nc}"
