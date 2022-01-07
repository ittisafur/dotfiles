" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    " Vim Surround
    Plug 'tpope/vim-surround'
    " Theme Installation
    Plug 'morhetz/gruvbox'
    " Intellisense
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Airline and Airline Theme Installation
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " Ranger
    Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
    " Fzf and vim-rooter
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'airblade/vim-rooter'
    " Project Management
    Plug 'mhinz/vim-startify'
    Plug 'mhinz/vim-signify'
    " Git Integration
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'junegunn/gv.vim'
    Plug 'APZelos/blamer.nvim'
    " Which Key
    Plug 'liuchengxu/vim-which-key'
    " Emmet
    Plug 'mattn/emmet-vim'
    " NERD Commenter
    Plug 'preservim/nerdcommenter'
    " PHP Plugins
    Plug 'arnaud-lb/vim-php-namespace'
    Plug 'Rican7/php-doc-modded'
    " Laravel Blade
    Plug 'jwalton512/vim-blade'
    " Quokka Alternative Codi
    Plug 'metakirby5/codi.vim'
    Plug 'heavenshell/vim-jsdoc', {'for': ['javascript', 'javascript.jsx','typescript', 'javascript.vue'],'do': 'make install'}
    " Liquid Support
    Plug 'tpope/vim-liquid'
    " Vim Import
    Plug 'yardnsm/vim-import-cost', { 'do': 'npm install' }
    " Vim Snippets
    Plug 'honza/vim-snippets'
    Plug 'github/copilot.vim'
call plug#end()
