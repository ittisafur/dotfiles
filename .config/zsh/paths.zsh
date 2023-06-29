# PNPM Paths
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

# Rbenv for Ruby Management
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# NVM for Node Management
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Include Path for all user binaries
export PATH="/usr/local/bin:$PATH"

# Lunarvim Paths
export LUNARVIM_CONFIG_DIR="$HOME/.config/lvim"
export LUNARVIM_RUNTIME_DIR="$HOME/.local/share/lunarvim"
export LUNARVIM_CACHE_DIR="$HOME/.cache/lunarvim"

# Go Path
export PATH=$PATH:/usr/local/go/bin
