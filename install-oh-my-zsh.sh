if [ ! -d ~/.oh-my-zsh ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# Aliases
aliasesStartLine=$(grep -n Start:Aliases ~/.zshrc | grep -Eo ^[^:]+)
aliasesEndLine=$(grep -n End:Aliases ~/.zshrc | grep -Eo ^[^:]+)
if [ ! -z "$aliasesStartLine" ] || [ ! -z "$aliasesEndLine" ] ; then
  aliasesStartLine=$(( $aliasesStartLine-1 ))
  sed -i '' "$aliasesStartLine,$aliasesEndLine d" ~/.zshrc
fi

cat <<EOT >> ~/.zshrc

# Start:Aliases
alias pg_start="launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
alias pg_stop="launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
alias envim="nvim ~/.config/nvim/init.vim"
alias vi=nvim
alias svi="sudo vi"
# End:Aliases
EOT

# Plugins

# Remove initial plugins line
pluginsLine=$(grep -n ^plugins= ~/.zshrc | grep -Eo ^[^:]+)
if [ ! -z "$pluginsLine" ] ; then
  aliasesStartLine=$(( $aliasesStartLine-1 ))
  sed -i '' "$pluginsLine d" ~/.zshrc
fi

pluginsStartLine=$(grep -n Start:Plugins ~/.zshrc | grep -Eo ^[^:]+)
pluginsEndLine=$(grep -n End:Plugins ~/.zshrc | grep -Eo ^[^:]+)
if [ ! -z "$pluginsStartLine" ] || [ ! -z "$pluginsEndLine" ] ; then
  pluginsStartLine=$(( $pluginsStartLine-1 ))
  sed -i '' "$pluginsStartLine,$pluginsEndLine d" ~/.zshrc
fi

cat <<EOT >> ~/.zshrc

# Start:Plugins
plugins=(git yarn npm npx node z tmux vi-mode sudo osx jump docker-compose docker)
# End:Plugins
EOT

source ~/.zshrc

if [ ! -d ~/.oh-my-zsh ]; then
  chsh -s $(which zsh)
fi
