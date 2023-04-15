#!/bin/bash
# run this script from the directory containing setup files,
# while in graphical environment

# necessary packages for librewolf audio
sudo apt install -y alsa-utils pulseaudio

setup_dir=$(pwd)

# runs librewolf to initialise the .librewolf directory
timeout 5s librewolf

cd ~/.librewolf/*-default/
mkdir chrome
cp $setup_dir/userChrome.css ./chrome/
cp $setup_dir/user.js ./
