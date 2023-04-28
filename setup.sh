#!/bin/bash
# run this script from the directory containing setup files


sudo apt update && sudo apt upgrade -y

setup_dir=$(pwd)

echo Installing fonts
sudo apt install -y fontconfig
mkdir -p ~/.local/share
cp -r $setup_dir/fonts ~/.local/share/
fc-cache -f

echo Installing offline copies of suckless utilites
sudo apt install -y build-essential libx11-dev libxinerama-dev sharutils libxft-dev \
libx11-xcb-dev libxcb-res0-dev \
libxrandr-dev libxpm-dev git xorg

	mkdir -p ~/.config/suckless
	cd ~/.config/suckless
	cp -r $setup_dir/slock ./
	git clone https://github.com/delicious1341/dwm-flexipatch --depth=1
	git clone https://github.com/delicious1341/dmenu-flexipatch --depth=1
	git clone https://github.com/delicious1341/st-flexipatch --depth=1
	for d in ~/.config/suckless/*;
	do
		(cd "$d" && make && sudo make install)
	done

echo Editing .bashrc for conveniences, pip installed binaries and custom .scripts
echo "alias grep='grep --color=auto'" >> ~/.bashrc
echo "alias l='ls -AghoS1 --time-style=long-iso'" >> ~/.bashrc
cp -r $setup_dir/scripts ~/.scripts
cd ~/.scripts
	for s in ./*;
	do
		(chmod +x ./"$s")
	done
echo 'export PATH="${PATH}:${HOME}/.local/bin/:${HOME}/.scripts/"' >> ~/.bashrc

echo Installing pywal
sudo apt install -y python3-pip imagemagick feh xdotool
pip3 install --user pywal
~/.local/bin/wal
cp -r $setup_dir/colors.Xresources ~/.config/wal/templates/

echo Installing picom
sudo apt install -y libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-dpms0-dev \
	libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev \
	libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev \
	libxcb-glx0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl-dev libegl-dev \
	libpcre2-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev meson \
	libpcre3-dev python3-pip git
pip3 install --user ninja meson
cd ~/.config
git clone https://github.com/yshui/picom --depth=1
cd picom
git submodule update --init --recursive
meson setup --buildtype=release . build
ninja -C build
sudo ninja -C build install
cp -r $setup_dir/picom.conf ~/.config/picom/

echo Setup .xinitrc and wallpaper
cp -r $setup_dir/.xinitrc ~/
mkdir ~/Downloads
cp -r $setup_dir/art.jpeg ~/Downloads/

echo Installing LibreWolf
sudo apt install -y curl
curl https://deb.librewolf.net/keyring.gpg | gpg --dearmor \
	    | sudo tee /usr/share/keyrings/librewolf.gpg >/dev/null
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/librewolf.gpg] \
	http://deb.librewolf.net $(lsb_release -sc) main" \
	    | sudo tee /etc/apt/sources.list.d/librewolf.list
sudo apt update
sudo apt install -y librewolf

sudo reboot
