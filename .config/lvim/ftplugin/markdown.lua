local formatters = require "lvim.lsp.null-ls.formatters"

formatters.setup{
  {
    exe = "prettier",
    filetypes = {"md", "markdown", "mdx"},
  },
}

vim.cmd[[setlocal nospell]]
vim.cmd[[setlocal conceallevel=2]]


