#!/bin/sh
#
mkdir -p ~/.vim
touch ~/.vim/.vimxfer
chown gql:gql ~/.vim/.vimxfer
cp $PWD/vimrc.vim ~/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
