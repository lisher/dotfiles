#!/bin/bash

# path to the repo from which this script was executed
CURRENT_REPO=$(dirname $(readlink -f $0))

PROFILE_CONF=~/.profile

BASHRC=~/.bashrc
BASH_ALIASES=~/.bash_aliases

GITCONFIG=~/.gitconfig
GITIGNORE=~/.gitignore

TMUX_CONF=~/.tmux.conf

BACKUP_EXT=.bac

# 0 - success
# 1 - not all files were linked
status=0

# $1 - target config file
# $2 - relative path to file in this repo to link as target
create_link()
{
  if [ ! -f $CURRENT_REPO/$2 ]; then
    echo "File $2 doesn't exists in this repository, path $CURRENT_REPO/$2"
    exit 2
  fi

  if [ -L $1 ]; then
    echo "$1 file exists and is a symbolic link (to `readlink -f $1`), unlinking"
    unlink $1
  fi

  if [ -f $1 ]; then
    if [ -f $1$BACKUP_EXT ]; then
      echo "File $1 exists and backup file $1$BACKUP_EXT is present, linking skipped"
      status=1
      return
    else
      echo "File $1 exists, creating backup $1$BACKUP_EXT"
      mv $1 $1$BACKUP_EXT
    fi
  fi

  ln -s $CURRENT_REPO/$2 $1

}

create_link $PROFILE_CONF general/profile

create_link $BASHRC bash/bashrc
create_link $BASH_ALIASES bash/bash_aliases

create_link $GITCONFIG git/gitconfig
create_link $GITIGNORE git/gitignore

create_link $TMUX_CONF tmux/tmux_conf

if [ $status -eq 1 ]; then
  echo "\n Not all files were correctly linked!"
fi
