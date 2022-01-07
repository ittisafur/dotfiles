"let g:user_emmet_install_global = 0
autocmd FileType html,css,blade,php,javascript,jsx,hbs,vue,js,xml,php.css.html EmmetInstall
"autocmd FileType html,css,jsx,vue,php,hbs EmmetInstall
let g:user_emmet_expandabbr_key='<Tab>'
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
