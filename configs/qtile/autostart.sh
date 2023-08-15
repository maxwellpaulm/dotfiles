#!/usr/bin/env bash 

COLORSCHEME="doom-one"

festival --tts $HOME/.config/qtile/welcome_msg &
lxsession &
picom &
sleep 3 && conky -c "$HOME"/.config/conky/qtile/"$COLORSCHEME"-01.conkyrc &
# volumeicon &
# nm-applet &
"$HOME"/.screenlayout/layout.sh &
feh --randomize --bg-fill /usr/share/wallpapers/*
