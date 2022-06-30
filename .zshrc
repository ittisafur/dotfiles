# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="agnoster"


# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    bundler
    rbenv
    ruby
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

function zsh_add_file() {
    [ -f "$HOME/$1" ] && source "$HOME/$1"
}

# Add Aliases
zsh_add_file "zsh-aliases"


# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='lvim'
 fi

source /home/undefined/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export PATH="/home/undefined/.local/bin:$PATH"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/undefined/.sdkman"
[[ -s "/home/undefined/.sdkman/bin/sdkman-init.sh" ]] && source "/home/undefined/.sdkman/bin/sdkman-init.sh"
export TERM=xterm-256color
alias laravel="~/.config/composer/vendor/bin/laravel" 

alias snips="~/.config/vim/snips"
export PATH=/opt/firefox/firefox:$PATH
codi() {
   local syntax="${1:-javascript}"
   shift
   nvim -c \
     "let g:startify_disable_at_vimenter = 1 |\
     set bt=nofile ls=0 noru nonu nornu |\
     hi CodiVirtualText guifg=red
     hi ColorColumn ctermbg=NONE |\
     hi VertSplit ctermbg=NONE |\
     hi NonText ctermfg=0 |\
     Codi $syntax" "$@"
}
# Rbenv Ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Go lang
export PATH="$HOME/go/bin:$PATH"

# Composer PHP
export PATH="$HOME/.config/composer/vendor/bin:$PATH"
export PATH=~/.local/bin:$PATH

# Ptsh Start
# alias ls="ptls"
# alias pwd="ptpwd"
alias mkdir="ptmkdir"
alias touch="pttouch"
# alias cp="ptcp"
# PTsh End

# Moving cat with bat
if [ "$(command -v bat)" ]; then
  unalias -m 'cat'
  alias cat='bat --theme="gruvbox-dark"'
fi
# Moving cat with bat End

# color ls config
if [ "$(command -v colorls)" ]; then
  unalias -m 'ls'
  alias ls='colorls $1'
fi
# color ls config End

# Adding Android Configurations
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=~/Library/Android/sdk/tools:$PATH
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools/bin

alias aw-qt="/usr/local/src/activitywatch/aw-qt"
alias lvimsnips="cd /home/undefined/.local/share/lunarvim/site/pack/packer/opt/friendly-snippets"
export PATH=$PATH:/usr/lib/postgresql/13/bin

export LIBVIRT_DEFAULT_URI='qemu:///system'

# Kitty specific config
#export KITTY_CONFIG_DIR=$HOME/.config/kitty
#export KITTY_THEME_DIR=$KITTY_CONFIG_DIR/themes
alias icat="kitty +kitten icat"
alias kittyrc="lvim ~/.config/kitty/kitty.conf"
# Deno 
export DENO_DIR=$HOME/.deno
export PATH=$DENO_DIR/bin:$PATH

#i3
alias i3config="lvim ~/.config/i3/config"
# go 
export PATH=$PATH:/usr/local/go/bin

# Nvidia Cuda
export PATH="/usr/local/cuda/bin:$PATH"
export LD_LIBRARY_PATH="/usr/local/cuda/lib64:$LD_LIBRARY_PATH"



PATH="/home/undefined/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/undefined/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/undefined/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/undefined/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/undefined/perl5"; export PERL_MM_OPT;

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
