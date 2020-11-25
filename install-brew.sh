#!/bin/bash

if ! brew -v > /dev/null; then
    echo "Installing homebrew"
    ruby -e "$( curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install )"
fi

echo -e "\\n\\nInstalling homebrew packages..."
formulas=(
  vim
  git
  tmux
  mas
  zsh
  tree
  ack
  nvim
  zsh
)

brew tap homebrew/core
brew tap homebrew/bundle
brew tap homebrew/services
brew tap homebrew/cask-fonts

cask_formulas=(
  google-chrome
  vlc
  font-jetbrains-mono
  hyper
  notion
)

install_packages() {
  cask=false
  if [ "$1" = "cask" ]; then
    cask=true
    shift
  fi

  packages=("$@")

  for package in "${packages[@]}"; do
    if $cask; then
      if brew cask list "$package" > /dev/null; then
        echo "$package already installed"
      else
        brew cask install "$package"
      fi
    else
      if brew list $package > /dev/null; then
        echo "$package already installed"
      else
        brew install "$package"
      fi
    fi
  done
}

install_packages "${formulas[@]}"
install_packages "cask" "${cask_formulas[@]}"

echo "\n\nBrew packages installed"

echo "\n\nInstall Oh My ZSH..."

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
