#!/bin/bash
# run this script from the directory containing setup files,
# while in graphical environment


setup_dir=$(pwd)

timeout 5s librewolf
cd ~/.librewolf/*-default/
mkdir chrome
cp $setup_dir/userChrome.css ./chrome/
cp $setup_dir/user.js ./