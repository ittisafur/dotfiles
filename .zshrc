# Add deno completions to search path
if [[ ":$FPATH:" != *":/home/undefined/.zsh/completions:"* ]]; then export FPATH="/home/undefined/.zsh/completions:$FPATH"; fi
# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"
plug "zap-zsh/sudo"
plug "zap-zsh/supercharge"
plug "zap-zsh/exa"
plug "zap-zsh/completions"

# Load and initialise completion system
autoload -Uz compinit
compinit


# Load Paths
plug "$HOME/.config/zsh/paths.zsh"

# Load Functions 
plug "$HOME/.config/zsh/functions/main.zsh"

# Load Aliases
plug "$HOME/.config/zsh/aliases/main.zsh"


# bun completions
[ -s "/home/undefined/.bun/_bun" ] && source "/home/undefined/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/undefined/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/undefined/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/undefined/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/undefined/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

. "/home/undefined/.deno/env"
