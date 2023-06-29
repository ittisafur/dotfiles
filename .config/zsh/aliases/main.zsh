# Import all aliases here from $HOME/.config/zsh/aliases except main.zsh
for alias in $(ls $HOME/.config/zsh/aliases | grep -v main.zsh); do
  source $HOME/.config/zsh/aliases/$alias
done
