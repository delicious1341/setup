convert ~/Downloads/art.jpeg -resize x540 ~/Downloads/art.jpeg
convert ~/Downloads/art.jpeg -resize 1920x1080^ -gravity center -extent 1920x1080 -blur 0x20 ~/Downloads/wallpaper.jpeg
convert ~/Downloads/wallpaper.jpeg -gravity center ~/Downloads/art.jpeg -composite ~/Downloads/lockscreen.xpm
~/.scripts/pywalstart.sh
