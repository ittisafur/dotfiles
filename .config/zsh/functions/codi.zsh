# Ask for the language server

# Codi config with option to pick a language server with go, php ,javascript, typescript
codi() {
  local syntax="${1:-javascript}"
  shift
  nvim -c \
    "let g:startify_disable_at_vimenter = 1 |\
    set bt=nofile ls=0 noru nonu nornu |\
    hi ColorColumn ctermbg=NONE |\
    hi VertSplit ctermbg=NONE |\
    hi NonText ctermfg=0 |\
    Codi $syntax" "$@" 
}
# Codi config End
#
   # local syntax="${1:-javascript}"
   # shift
   # lvim -c \
   #   "let g:startify_disable_at_vimenter = 1 |\
   #   set bt=nofile ls=0 noru nonu nornu |\
   #   hi CodiVirtualText guifg=white
   #   hi ColorColumn ctermbg=NONE |\
   #   hi VertSplit ctermbg=NONE |\
   #   hi NonText ctermfg=0 |\
   #   Codi $syntax" "$@"
