#!/bin/bash
# run this script from the directory containing setup files


sudo apt update && sudo apt upgrade -y

setup_dir=$(pwd)

sudo apt install -y vim-gtk zathura texlive-full xournal sxiv mpv libreoffice
cp -r $setup_dir/.vimrc ~/
mkdir -p ~/.config/zathura
cp -r $setup_dir/zathurarc ~/.config/zathura/


pip3 install --user yt-dlp 
