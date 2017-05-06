#!/usr/bin/env bash
# will be called in the bspwmrc file

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"

fcitx -d

# autocutsel
autocutsel -selection PRIMARY -fork

# make keyboard response faster
xset r rate 200 30

if [ -f "$HOME/.Xresources" ]; then
    xrdb -merge "$HOME/.Xresources"
fi

#add private fonts
if [ -d "$HOME/.fonts" ]; then
    xset fp+ "$HOME/.fonts"
    xset fp rehash
fi

# enable natural scrolling and remap Caps Lock key to become left Ctrl
if [ -f "$HOME/.Xmodmap" ]; then
    xmodmap "$HOME/.Xmodmap"
fi

# set wallpaper
if hash hsetroot 2>/dev/null; then
    hsetroot -tile "$HOME/.black"
fi

xsetroot -cursor_name left_ptr

#disable dpms
if [ $(hostname) = "zhaoxin" ]; then
    xset -dpms
fi

# Mixed effect
compton --config ~/.dotfiles/.config/.compton.conf.t450s -b

polybar main &

# dropbox
/opt/dropbox/dropboxd &
