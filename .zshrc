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


# Bun completions
[ -s "/home/undefined/.bun/_bun" ] && source "/home/undefined/.bun/_bun"

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Deno
. "/home/undefined/.deno/env"

# pnpm
export PNPM_HOME="/home/undefined/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
alias claude="/home/undefined/.claude/local/claude"
