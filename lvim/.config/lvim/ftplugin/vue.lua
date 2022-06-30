local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    exe = "prettier",
    args = {
      "--no-semi", "--single-quote"
    }
  }
}
