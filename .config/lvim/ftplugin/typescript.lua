require("lvim.lsp.manager").setup("tsserver")

local formatters = require "lvim.lsp.null-ls.formatters"
local linters = require "lvim.lsp.null-ls.linters"
formatters.setup {
  {
    exe = "prettier",
    filetypes = {"typescript"},
    args = {
     "--jsx-single-quote",
      "--print-width", "120",
      "--single-quote"
    }
  }
}

linters.setup {
  { command = "eslint_d", filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" } }
}
