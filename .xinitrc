#!/bin/sh

# /etc/X11/xinit/xinitrc
#
# global xinitrc file, used by all X sessions started by xinit (startx)

# invoke global X session script
#. /etc/X11/Xsession
xrandr --output Virtual-1 --mode 1920x1080 &
~/.scripts/wallpaper_set &
~/.scripts/picom_start &
exec dwm
