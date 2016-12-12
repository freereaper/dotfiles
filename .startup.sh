#!/bin/bash

if [ -f "$HOME/.Xresources" ]; then
    xrdb -merge "$HOME/.Xresources"
fi

xsetroot -cursor_name left_ptr

#add private fonts
if [ -d "$HOME/.fonts" ]; then
    xset fp+ "$HOME/.fonts"
    xset fp rehash
fi

#make keyboard response faster
xset r rate 200 30

# enable natural scrolling and remap Caps Lock key to become left Ctrl
if [ -f "$HOME/.Xmodmap" ]; then
    xmodmap "$HOME/.Xmodmap"
fi

# xclip
autocutsel -selection CLIPBOARD -fork
autocutsel -selection PRIMARY -fork


# set wallpaper
if hash hsetroot 2>/dev/null; then
    hsetroot -fill "$HOME/.blackjpg"
fi

# install open-vm-tools and open-vm-tools-desktop to enable fullscreen in vm
if hash vmware-user-suid-wrapper 2>/dev/null; then
    vmware-user-suid-wrapper 2>/dev/null
fi
