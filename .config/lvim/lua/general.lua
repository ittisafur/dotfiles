-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = ","

-- Lua Line default configs
lvim.builtin.lualine.style = "lvim"
-- Show dot files in NvimTree
lvim.builtin.nvimtree.hide_dotfiles = 0

-- Fold method
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false -- if this option is true and fold method option is other than normal, every time a document is opened everything will be folded.




-- General --

lvim.builtin.bufferline.active = true
-- lvim.log.level = false -- Turn to "debug" while debugging
lvim.debug = true

vim.opt.wrap = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 6


vim.opt.mouse = "a"
vim.opt.foldmethod = "manual" -- folding set to "expr" for treesitter based folding
vim.opt.foldexpr = ""
vim.opt.termguicolors = true

-- Transparent
lvim.transparent_window = true

-- NvimTree
lvim.builtin.nvimtree.setup.view.side = "left"
-- lvim.builtin.nvimtree.show_icons.git = 0

-- Format on save
lvim.format_on_save.enabled = true
