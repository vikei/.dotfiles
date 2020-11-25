#!/bin/bash

if [ ! -f "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim ]; then
	curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

ln -f .config/nvim/init.vim ~/.config/nvim/init.vim
ln -f .config/nvim/coc-settings.json ~/.config/nvim/coc-settings.json

snippets_path=~/.config/nvim/ultisnips
if [ ! -d $snippets_path ]; then
	mkdir $snippets_path
fi
ln -f ./.config/nvim/ultisnips/* $snippets_path

nvim +PlugInstall +qall
