#!/bin/bash

# path to the repo from which this script was executed
CURRENT_REPO=$(dirname $(readlink -f $0))

BASHRC=~/.bashrc
BASH_ALIASES=~/.bash_aliases

GITCONFIG=~/.gitconfig
GITIGNORE=~/.gitignore

TMUX_CONF=~/.tmux.conf

# $1 - target config file
# $2 - relative path to file in this repo to link as target
create_link()
{
  if [ ! -f $CURRENT_REPO/$2 ]; then
    echo "File $2 doesn't exists in this repository, path $CURRENT_REPO/$2"
    return 1
  fi

  if [ -L $1 ]; then
    echo "$1 file exists and is a symbolic link, unlinking"
    unlink $1
  fi

  ln -s $CURRENT_REPO/$2 $1

}

create_link $BASHRC bash/bashrc
create_link $BASH_ALIASES bash/bash_aliases

create_link $GITCONFIG git/gitconfig
create_link $GITIGNORE git/gitignore

create_link $TMUX_CONF tmux/tmux_conf
