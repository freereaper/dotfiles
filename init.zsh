# just copy the init.zsh to the dir where you want to place your repos


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

function __symlink_config {
    if [ ! -f "$HOME/.config/$1" -a ! -d "$HOME/.config/$1" ]; then
        echo "symlinking $BASEDIR/.config/$1  => $HOME/.config/$1"
        ln -s "$BASEDIR/.config/$1" "$HOME/.config/$1"
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
    __symlink ".zshrc"
}

# }}}
#-------------------------------------------------------------------------------


#-------------------------------------------------------------------------------
# VIM {{{

function bootstrap-vim {
    if [ ! -f "$HOME/.vim/autoload/plug.vim" ];then
        curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    fi
    __symlink ".vimrc"
    __symlink ".vimrc-mini"
    __symlink ".vimrc-minimal"
}

# }}}
#-------------------------------------------------------------------------------


#-------------------------------------------------------------------------------
# bspwm {{{

function bootstrap-bspwm {
    __symlink_config "bspwm"
    __symlink_config "sxhkd"
}

# }}}
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
# urxvt {{{

function bootstrap-urxvt {
    perl_ext=$BASEDIR/urxvt/perl-extensions
    cp -f $BASEDIR/urxvt/.Xresources ~/.Xresources
    perl -i -p -e "s!PATH_TO_PERL_EXT!$perl_ext!ig" ~/.Xresources
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
    echo "  excludefile = $HOME/.gitignore_global" >> "$HOME/.gitconfig"
    echo "  editor = vim" >> "$HOME/.gitconfig"

    echo "[branch]" >> "$HOME/.gitconfig"
    echo "  autosetuprebase = always" >> "$HOME/.gitconfig"

    echo "[push]" >> "$HOME/.gitconfig"
    echo "  default = simple" >> "$HOME/.gitconfig"
fi

# }}}
#-------------------------------------------------------------------------------

# --------------------powerline font-----------------------------------
__clone 'https://github.com/powerline/fonts.git' '.fonts'

# -------------------------tmux----------------------------------------
__symlink '.tmux.conf'

#---------------------------ag-----------------------------------------
__symlink '.agignore'

#---------------------------.profile-----------------------------------
__symlink '.profile'

#---------------------------.Xmodmap-----------------------------------
__symlink '.Xmodmap'

#---------------------------.inputrc-----------------------------------
__symlink '.inputrc'

#---------------------------.editrc------------------------------------
__symlink '.editrc'

#---------------------------.bashrc------------------------------------
__symlink '.editrc'

#-------------------------.gitignore-----------------------------------
__symlink ".gitignore_global"

#-------------------------.Xresources----------------------------------
__symlink ".Xresources"

#-----------------------------.npmrc-----------------------------------
__symlink ".npmrc"

#-------------------------.startup.sh----------------------------------
__symlink ".startup.sh"


bootstrap-pyenv

bootstrap-vim

bootstrap-zsh

bootstrap-bspwm

bootstrap-urxvt

export PATH="$BASEDIR/bin:$PATH"

