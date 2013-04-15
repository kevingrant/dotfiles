#!/bin/bash

DOTFILES_ROOT="`pwd`"

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

function link_file {
  if [ -e "$2" ] && [ ! -L "$2" ]; then
    mv $2 $2.bak
    success "Backup $2 to $2.bak"
  fi

  ln -sf $1 $2
  success "Link $1 to $2"
}

for source in `find $DOTFILES_ROOT -name _\*`
do
  dest="$HOME/`basename \"${source/_/.}\"`"
  link_file $source $dest
done
