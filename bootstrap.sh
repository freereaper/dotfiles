#!/usr/bin/env bash
# just copy the bootstrap.sh to the dir where you want to place your dotfiles, run ~./bootstrap.sh~

set -e

pushd `dirname $0` > /dev/null
BASEDIR=`pwd`
popd > /dev/null

# Functions {{{
function __symlink {
    if [ ! -f "$HOME/$1" -a ! -d "$HOME/$1" ]; then
        echo "symlinking $BASEDIR/$1  => $HOME/$1"
        ln -s "$BASEDIR/$1" "$HOME/$1"
    fi
}

function __symlink_rock {
    if [ ! -f "$HOME/$2" -a ! -d "$HOME/$2" ]; then
        echo "symlinking $BASEDIR/$1  => $HOME/$2"
        ln -s "$BASEDIR/$1" "$HOME/$2"
    fi
}

function __clone {
    if [ ! -d "$BASEDIR/$2" ]; then
        git clone --recursive "$1" "$BASEDIR/$2"
    fi
    __symlink $2
}

# }}}


#-------------------------------------------------------------------------------
# RUBY {{{

function bootstrap-rbenv {
    __clone 'https://github.com/sstephenson/rbenv.git' '.rbenv'
    if [ ! -d "$HOME/.rbenv/plugins/ruby-build" ]; then
        mkdir -p "$HOME/.rbenv/plugins"
        git clone https://github.com/sstephenson/ruby-build.git $HOME/.rbenv/plugins/ruby-build
    fi
}

# }}}
#-------------------------------------------------------------------------------


#-------------------------------------------------------------------------------
# PYTHON {{{

function bootstrap-pyenv {
    __clone 'https://github.com/yyuu/pyenv.git' '.pyenv'
    if [ ! -d "$HOME/.pyenv/plugins/pyenv-virtualenv" ]; then
        mkdir -p "$HOME/.pyenv/plugins"
        git clone https://github.com/yyuu/pyenv-virtualenv.git $HOME/.pyenv/plugins/pyenv-virtualenv
    fi
}

# }}}
#-------------------------------------------------------------------------------


#-------------------------------------------------------------------------------
# NODE {{{

function bootstrap-nvm {
    __clone 'https://github.com/creationix/nvm.git' '.nvm'
    touch "$HOME/.profile"
    echo "export NVM_DIR=\"$HOME/.nvm\"" >> $HOME/.profile
    echo "source $HOME/.nvm/nvm.sh" >> $HOME/.profile
}

# }}}
#-------------------------------------------------------------------------------


#-------------------------------------------------------------------------------
# GO {{{

function bootstrap-gvm {
    zsh < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
    echo "source $HOME/.gvm/scripts/gvm" >> $HOME/.profile
}

# }}}
#-------------------------------------------------------------------------------


#-------------------------------------------------------------------------------
# zsh {{{

function bootstrap-zsh {
    __clone 'https://github.com/freereaper/oh-my-zsh.git' '.oh-my-zsh'
    __symlink_rock "zsh/.zshrc" ".zshrc"
}

# }}}
#-------------------------------------------------------------------------------


#-------------------------------------------------------------------------------
# VIM {{{

function bootstrap-vim {
    if [ ! -f "$HOME/.vim/autoload/plug.vim" ];then
        curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    fi
    __symlink_rock "vim/.vimrc"  ".vimrc"
    __symlink_rock "vim/.vimrc-mini" ".vimrc-mini"
    __symlink_rock "vim/.vimrc-minimal" ".vimrc-minimal"
}

# }}}
#-------------------------------------------------------------------------------


#-------------------------------------------------------------------------------
# bspwm {{{

function bootstrap-bspwm {
    #cp -f $BASEDIR/bspwm.desktop /usr/share/xsessions/

    __symlink ".config/bspwm"
    __symlink ".config/sxhkd"
}

# }}}
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
# urxvt {{{

function bootstrap-urxvt {
    echo "copy $BASEDIR/urxvt/.Xresources  => $HOME/.Xresources"
    perl_ext=$BASEDIR/urxvt/perl-extensions
    cp -f $BASEDIR/urxvt/.Xresources ~/.Xresources
    perl -i -p -e "s!PATH_TO_PERL_EXT!$perl_ext!ig" ~/.Xresources
    __symlink_rock "urxvt/.colors" ".colors"
}

# }}}
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
# tmux {{{

function bootstrap-tmux {
    if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
        mkdir -p "$HOME/.tmux/plugins"
        git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
    fi
    __symlink_rock "tmux/.tmux.conf"  ".tmux.conf"

    ## use CTRAL-A + I to install the tmux plugins.
}

# }}}
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
# beautify {{{

function bootstrap-beauty {

    __symlink ".config/gtk-3.0"
    __symlink ".gtkrc-2.0"

    # polybar.
    __symlink ".config/polybar"

    # ranger
    __symlink ".config/ranger"
}

# }}}
#-------------------------------------------------------------------------------



#-------------------------------------------------------------------------------
# GIT {{{

if [ ! -f "$HOME/.gitconfig" ]; then
    touch "$HOME/.gitconfig"

    echo "[user]" >> "$HOME/.gitconfig"
    echo "  name = reaper" >> "$HOME/.gitconfig"
    echo "  email = freereaper@aliyun.com" >> "$HOME/.gitconfig"

    echo "[alias]" >> "$HOME/.gitconfig"
    echo "  br = branch" >> "$HOME/.gitconfig"
    echo "  st = status" >> "$HOME/.gitconfig"
    echo "  co = checkout" >> "$HOME/.gitconfig"
    echo "  ci = commit" >> "$HOME/.gitconfig"
    echo "  log = log --graph" >> "$HOME/.gitconfig"
    echo "  rb = rebase" >> "$HOME/.gitconfig"
    echo "  lg = log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all" >> "$HOME/.gitconfig"

    echo "[core]" >> "$HOME/.gitconfig"
    echo "  excludesfile = $HOME/.gitignore_global" >> "$HOME/.gitconfig"
    echo "  editor = vim" >> "$HOME/.gitconfig"

    echo "[branch]" >> "$HOME/.gitconfig"
    echo "  autosetuprebase = always" >> "$HOME/.gitconfig"

    echo "[push]" >> "$HOME/.gitconfig"
    echo "  default = simple" >> "$HOME/.gitconfig"
fi

# }}}
#-------------------------------------------------------------------------------

# -------------------------powerline font---------------------------------------

__clone 'https://github.com/powerline/fonts.git' '.fonts'

#-------------------------------------------------------------------------------



#----------------------------------configs--------------------------------------
__symlink_rock "misc/black.jpg"     ".black"
__symlink_rock "less/.LESS_TERMCAP" ".LESS_TERMCAP"
__symlink_rock "misc/.inputrc"      ".inputrc"
__symlink_rock "misc/.Xmodmap"      ".Xmodmap"
__symlink_rock "misc/.editrc"       ".editrc"
__symlink_rock "misc/.startup.sh"   ".startup.sh"

__symlink ".xinitrc"
__symlink ".config/compton.conf"
__symlink ".agignore"
__symlink ".profile"
__symlink ".bashrc"
__symlink ".gitignore_global"
__symlink ".npmrc"
__symlink ".ctags"
__symlink ".LS_COLORS"
#-------------------------------------------------------------------------------


#-----------------------------------bootstrap-----------------------------------
bootstrap-pyenv

bootstrap-vim

bootstrap-zsh

bootstrap-bspwm

bootstrap-urxvt

bootstrap-tmux

bootstrap-beauty

#-------------------------------------------------------------------------------

export PATH="$BASEDIR/bin:$PATH"

if [ $(hostname) = "T450s" ]; then
    echo "t450s"
elif [ $(hostname) = "zhaoxin" ]; then
    echo "zhaoxin"
fi
