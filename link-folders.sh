#!/bin/bash

if [ ! -f ~/.tmux.conf ]; then
  ln .tmux.conf ~/.tmux.conf
fi

if [ ! -d ~/.config ]; then
  cp -r .config ~/.config
fi 
