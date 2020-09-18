#!/bin/bash

echo "Link .vimrc to ~/.vimrc"
ln .vimrc ~/.vimrc
echo "Done"

echo "Intalling plug..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "Done"

echo "Installing plugings..."
vim +PlugInstall +qall
echo "Done"

# install pip3 install neovim

echo "Link snippets"
snippets_path=~/.config/coc/ultisnips
[[ -d $snippets_path ]] || mkdir $snippets_path
ln ultisnips/* $snippets_path
echo "Done"
