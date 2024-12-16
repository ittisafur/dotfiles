require("lvim.lsp.manager").setup("tsserver")

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    exe = "prettier",
    filetypes = { "typescriptreact" },
    -- args = { "--single-quote", "--jsx-single-quote" },
  },
}

vim.cmd([[
  autocmd BufRead,BufNewFile *.tsx set filetype=typescriptreact
  autocmd BufRead,BufNewFile *.jsx set filetype=javascriptreact
]])
