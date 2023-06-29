# Color ls config
# function ls() {
#  if [ "$(command -v colorls)" ]; then
#    unalias -m 'ls'
#    alias ls='colorls $1'
#  fi
# }
# Color ls config End


# Import all functions here from $HOME/.config/zsh/functions except main.zsh
for file in $HOME/.config/zsh/functions/*; do
  if [ "$file" != "$HOME/.config/zsh/functions/main.zsh" ]; then
    source "$file"
  fi
done


