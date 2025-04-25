-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = ","

-- Lua Line default configs
lvim.builtin.lualine.style = "lvim"
-- Show dot files in NvimTree
lvim.builtin.nvimtree.hide_dotfiles = 0

-- Fold method
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- vim.opt.foldenable = false -- if this option is true and fold method option is other than normal, every time a document is opened everything will be folded.

-- vim.opt.mouse = "a"
-- vim.opt.foldmethod = "manual" -- folding set to "expr" for treesitter based folding
-- vim.opt.foldexpr = ""
-- vim.opt.termguicolors = true
--
vim.opt.foldmethod     = "indent"
vim.opt.foldlevelstart = 99     -- start fully open
vim.opt.foldenable     = true   -- allow folds

-- (Optional) if you only want indent-folding in certain filetypes,
-- you can wrap it in an autocmd:
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "html","css","scss",
    "javascript","javascriptreact",
    "typescript","typescriptreact",
    "astro","svelte","vue","mdx"
  },
  callback = function()
    vim.opt_local.foldmethod     = "indent"
    vim.opt_local.foldlevelstart = 99
    vim.opt_local.foldenable     = true
  end,
})




-- General --

lvim.builtin.bufferline.active = true
-- lvim.log.level = false -- Turn to "debug" while debugging
lvim.debug = true

vim.opt.wrap = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 6


-- Transparent
lvim.transparent_window = true

-- NvimTree
lvim.builtin.nvimtree.setup.view.side = "left"

-- lvim.builtin.nvimtree.show_icons.git = 0

-- Format on save
lvim.format_on_save.enabled = true
-- lvim.builtin.nvimtree.setup = {

-- }

local lspconfig = require("lspconfig")
lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT", -- Use LuaJIT for Neovim
        path = vim.split(package.path, ";"),
      },
      diagnostics = {
        globals = { "vim" }, -- Recognize Neovim globals
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false, -- Avoid issues with third-party libraries
      },
      telemetry = {
        enable = false,
      },
    },
  },
}

local function on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- Default NvimTree keybindings
  api.config.mappings.default_on_attach(bufnr)

  -- Custom keybindings
  local custom_keys = {
    ["<CR>"] = { api.node.open.edit, opts "Open" }, -- Default behavior for Enter key
    ["l"] = { api.node.open.edit, opts "Open" },
    ["o"] = { api.node.open.edit, opts "Open" },
    ["v"] = { api.node.open.vertical, opts "Open: Vertical Split" },     -- Open in vertical split (right)
    ["s"] = { api.node.open.horizontal, opts "Open: Horizontal Split" }, -- Open in horizontal split (bottom)
    ["h"] = { api.node.navigate.parent_close, opts "Close Directory" },  -- Close folder
    ["C"] = { api.tree.change_root_to_node, opts "CD" },                 -- Change directory
  }

  -- Load custom keybindings
  require("lvim.keymappings").load_mode("n", custom_keys)
end

lvim.builtin.nvimtree.setup.on_attach = on_attach
