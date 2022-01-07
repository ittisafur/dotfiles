function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>
autocmd FileType php inoremap <Leader>su <Esc>:call PhpSortUse()<CR>
autocmd FileType php noremap <Leader>su :call PhpSortUse()<CR>
let g:php_namespace_sort_after_insert = 1

