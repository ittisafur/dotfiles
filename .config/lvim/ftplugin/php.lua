local formatters = require "lvim.lsp.null-ls.formatters"

formatters.setup {
    {
      exe = "phpcbf",
      args = { "--standard=PSR12", "-q", "-" },
      stdout = true,
    }
}

lvim.keys.normal_mode["<leader>u"] = "<Esc>:call PhpInsertUse()<CR>"
vim.opt.expandtab = true -- convert tabs to spaces
-- PSR-12 Coding Style
vim.opt.shiftwidth = 4 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 4 -- insert 2 spaces for a tab
