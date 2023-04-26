#!/bin/bash
# run this script from the directory containing setup files


sudo apt update && sudo apt upgrade -y

setup_dir=$(pwd)

sudo apt install -y vim-gtk zathura texlive-full xournal sxiv mpv
cp -r $setup_dir/.vimrc ~/

pip3 install --user yt-dlp

xdg-mime default sxiv.desktop image/jpeg
xdg-mime default sxiv.desktop image/png
xdg-mime default sxiv.desktop image/webp
xdg-mime default librewolf.desktop text/html
xdg-mime default librewolf.desktop application/pdf
