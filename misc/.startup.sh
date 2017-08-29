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
    xset fp rehash &
fi

# enable natural scrolling and remap Caps Lock key to become left Ctrl
if [ -f "$HOME/.Xmodmap" ]; then
    xmodmap "$HOME/.Xmodmap"
fi

# set wallpaper
if hash feh 2>/dev/null; then
    feh --bg-scale "$HOME/.black"
fi

# for debug
echo $MONITOR_MAIN

xsetroot -cursor_name left_ptr

# Mixed effect
compton --config ~/.dotfiles/.config/.compton.conf.t450s -b

if [ $(hostname) = "zhaoxin" ]; then
    # keep the screen light
    xset -dpms
    polybar main.$(hostname) &
    polybar right.$(hostname) &
    (http_proxy="http://10.30.24.3:985" /opt/dropbox/dropboxd &)&
elif [ $(hostname) = "T450s" ]; then
    #for mon in $MONITOR_LIST; do
    #    echo "Lauching on monitor $mon"
    #    env MONITOR=$mon polybar $(hostname) &
    #done

    polybar main.$(hostname) &

    if [ "$POLYBAR_RIGHT_ENABLE" = true ]; then
        polybar right.$(hostname) &
    fi

    /opt/dropbox/dropboxd &
fi
