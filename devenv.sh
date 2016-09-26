#!/usr/bin/env bash

# just 'ln -s devenv.sh /etc/profile.d/devenv.sh' to ensure this script will be excute when system start up


# set visible cursor in xmonad
xsetroot -cursor_name left_ptr

#xcompmgr &

# make keyboard response faster
xset r rate 200 30

# enable natural scrolling and remap Caps Lock key to become left Ctrl
if [ -f ~/.Xmodmap ]; then
    xmodmap ~/.Xmodmap
fi

#settings for p4v {
export PATH=/usr/local/devtool/p4v/bin:$PATH
#}

#settings for zx2000 toolchain {
export PATH=/usr/local/devtool/toolchain/zx2000/bin:$PATH
#}

#settings for git {
export PATH=/usr/local/git/bin:$PATH
#}

#personal tool{
export PATH=/home/reaper/bin:/home/reaper/mylib:$PATH
#}

