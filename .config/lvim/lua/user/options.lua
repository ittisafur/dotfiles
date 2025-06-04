-- Core editor & UI settings

-- Leader key
lvim.leader            = ","

-- Line numbers & wrapping
vim.opt.relativenumber = true
vim.opt.numberwidth    = 6
vim.opt.wrap           = true

-- Mouse support
vim.opt.mouse          = "a"

-- Allow swapping buffers without unloading the old one
vim.opt.hidden         = true

-- Folding: use indent-based folding for all your frontend filetypes
vim.opt.foldmethod     = "indent"
vim.opt.foldlevelstart = 99
vim.opt.foldenable     = true

-- only apply indent folding to certain filetypes
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "html", "css", "scss",
    "javascript", "javascriptreact",
    "typescript", "typescriptreact",
    "astro", "svelte", "vue", "mdx"
  },
  callback = function()
    vim.opt_local.foldmethod     = "indent"
    vim.opt_local.foldlevelstart = 99
    vim.opt_local.foldenable     = true
  end,
})

-- UI elements
lvim.transparent_window               = true
lvim.builtin.lualine.style            = "lvim"
lvim.builtin.bufferline.active        = true

-- NvimTree
lvim.builtin.nvimtree.hide_dotfiles   = 0
lvim.builtin.nvimtree.setup.view.side = "left"

-- Format on save
lvim.format_on_save.enabled           = true
