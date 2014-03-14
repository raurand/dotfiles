#!/bin/bash
#-----------------------------
#  .make.sh
#
#  This script creates symlinks from the home directory to the dotfile directory
#
#-----------------------------

#  Variables
dir=~/dotfiles		#  dotfiles directory
olddir=~/dotfiles_old	#  old dotfiles backup directory
files="bashrc vimrc vim #  list of files/folders to symlink in homedir


#  Create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo ".. done"

#  Change into the dotfiles directory
echo "Changing into the $dir directory
cd $dir
echo ".. done"

#  Move any existing dotfiles in homedir to dotfiles_old directory.
#  Then create symlinks
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file  ~/dotfiles_old/
    echo "Creating symlinks to $file in home directory"
    ln -s $dir/$file  ~/.$file
done
