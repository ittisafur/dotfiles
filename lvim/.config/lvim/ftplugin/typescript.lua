require("lvim.lsp.manager").setup("tsserver")

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    exe = "prettier",
    filetypes = {"typescript"},
    args = {
     "--single-quote",
     "--jsx-single-quote" }
  }
}
