# Composer Global Path
export COMPOSER_HOME="$HOME/.config/composer"
export PATH="$COMPOSER_HOME/vendor/bin:$PATH"

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

# Go and g Paths
export PATH=$PATH:/usr/local/go/bin
export GOROOT=$HOME/.local/share/golang
export GOPATH=$HOME/go
export PATH="$GOPATH/bin:$PATH";
# alias g="$GOPATH/bin/g"; # g-install: do NOT edit, see https://github.com/stefanmaric/g

# Android Studio Settings
export ANDROID_HOME="$HOME/Android/Sdk"
export PATH="$ANDROID_HOME/emulator:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$PATH"

# Anaconda
export PATH="$HOME/anaconda3/bin:$PATH"

# LVIM
export PATH=$PATH:~/.local/share/nvim/mason/bin
