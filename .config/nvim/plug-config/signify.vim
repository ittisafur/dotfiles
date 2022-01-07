let g:signify_sign_show_count = 0
let g:signify_sign_show_text = 1
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)
nmap <leader>gJ 9999<leader>gJ
nmap <leader>gK 9999<leader>gk
nmap <leader>gs :SignifyToggle<CR>
nmap <leader>gsh :SignifyToggleHighlight<CR>
