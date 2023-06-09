# GH create PR with args
function ghpr() {
  gh pr create --title "$1" --base "$2"
}

# Color ls config
function ls() {
 if [ "$(command -v colorls)" ]; then
   unalias -m 'ls'
   alias ls='colorls $1'
 fi
}
# Color ls config End

# Codi config
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
# Codi config End


