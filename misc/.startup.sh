#!/usr/bin/env bash
# will be called in the bspwmrc file


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
autocutsel -selection PRIMARY -fork


# set wallpaper
if hash hsetroot 2>/dev/null; then
    hsetroot -fill "$HOME/.black"
fi

#disable dpms
xset -dpms

#fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
fcitx -d
compton -b

