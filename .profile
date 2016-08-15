# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

pathAdd() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        PATH="${PATH:+"$PATH:"}$1"
    fi
}

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi


# some more ls aliases
alias ll='ls -alht'
alias la='ls -A'
alias l='ls -CF'

# List files only
# alias lsf="ls -lp | ag -v /" # (or grep -v '^d')
alias lsf="ls -alh | ag -v '^d'" # (or grep -v '^d')

# List directories only
alias lsd="ls -alh | ag '^d'" # (or grep -v '^d')


# change system-wide editor
export VISUAL="/usr/bin/vim"
export EDITOR="/usr/bin/vim"

# fix problem with vim colorscheme in tmux
# http://stackoverflow.com/questions/10158508/lose-vim-colorscheme-in-tmux-mode
# alias tmux="TERM=screen-256color-bce tmux" <- not very nice
#alias tmux="tmux -2" # force tmux to use 256 colors

# - Non-root user: set umask to `077` to increase security, so that the default
#   permission:
#   + new file is 600
#   + new directory is 700
# - Root: umask to `022`, so that default permission:
#   + new file is 644
#   + new directory is 755
# if [ "$EUID" -ne 0 ]; then
if (( $EUID != 0 )); then
    # non-root user
    umask 077
else
    # root
    umask 022
fi

# Use `umask 022` for sudo command to allow root user to create new file with 755
# permission, which allows reading and executing permissions to all users
sudo() {
    old=$(umask)
    umask 0022
    command sudo "$@"
    umask $old
}

# for mount/unmount USB flashdrive using devmon
alias um="udisks --mount"
alias uu="udisks --unmount"

autocutsel -selection CLIPBOARD -fork
autocutsel -selection PRIMARY -fork

#set P4CONFIG
if test -z "$P4CONFIG";then
	export P4CONFIG=$HOME/myenv/p4.conf
fi
