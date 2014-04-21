#!/bin/bash
#################################
# Symlink dotfiles to home dir
#################################

##################### Variables
dir=~/.dotfiles
bckupdir=~/.dotfilesbckup # Backup dir
#files="bashrc vimrc"     # Files to link
files=$@                  # Files to link
#####################

if (( $# == 0 ))
then
  echo "No files specified, exiting"
  exit 1
fi

if [ ! -d "$bckupdir" ] 
then
  echo "Making backup dir $bckupdir ..."
  mkdir "$bckupdir"
  echo "...Done"
else
  echo "Backup dir $bckupdir already exists, skipping mkdir"
fi

echo "Changing to $dir dir..."
cd $dir
echo "...Done"

echo "Backing up existing dotfiles and linking"
for file in $files; do
  echo "Moving $file to $bckupdir ..."
  mv ~/.$file $bckupdir
  [ -L $bckupdir/.$file ] && cp --remove-destination `readlink $bckupdir/.$file` $bckupdir/.$file 
  echo "Creating symlink to $file in home dir"
  ln -s $dir/$file ~/.$file
done
