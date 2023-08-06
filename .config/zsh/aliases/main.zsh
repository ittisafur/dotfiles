# Import all aliases here from $HOME/.config/zsh/aliases except main.zsh
for alias in $HOME/.config/zsh/aliases/*.zsh; do
  if [[ $alias != $HOME/.config/zsh/aliases/main.zsh ]]; then
    source $alias
  fi
done
