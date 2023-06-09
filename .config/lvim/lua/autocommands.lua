
  lvim.autocommands.custom_groups = vim.list_extend(lvim.autocommands.custom_groups, {
    { "InsertEnter", "*", "highlight PmenuSel ctermfg=242 ctermbg=0 gui=bold guifg=#2a3a33 guibg=#8091b2" },
    -- SymbolsOutline fix
    { "BufEnter", "*", "highlight Comment guifg=#667084 ctermfg=0" },
    { "BufEnter", "*", "highlight Visual guibg=#3B4252" },
  })
