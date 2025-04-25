-- tell lvim to never auto-configure the built-in tailwindcss server
vim.list_extend(
  lvim.lsp.automatic_configuration.skipped_servers,
  { "tailwindcss" }
)
-- Tailwindcss
require('lsp.tailwindcss')

-- General Settings
require('general')

-- ColorScheme
require('themes.poimandres'); -- Nord, Tokyonight, Rose Pine, Poimandres

-- Gui Settings
if lvim.colorscheme == 'nord' then
  require('gui.gui-general')
end
require('gui.gui-general')

-- Dashboard Settings
require('plug-settings.dashboard')

-- Treesitter
require('treesitters')

-- Personal Configurations
require('keymaps.keymappings')

-- Plugins
require('plugins')
-- Copilot
require('plug-settings.copilot')

-- Telescope Settings
require('plug-settings.telescope')


-- Graphql Settings
require('lsp.graphql')
require('lsp.shopify')
require('lsp-config.markdown')

-- Emmet Ls Settings
require('plug-settings.emmet')

-- Rust
require('lsp.rust')

-- Tailwindcss
require('lsp.tailwindcss')

-- Autocommands
require('autocommands')
-- Which Keys
require('plug-settings.whichkey')
lvim.builtin.which_key.setup.plugins.presets.z = true

-- Bufferline
local ok, bufferline_config = pcall(require, "plug-settings.bufferline")
if ok then
  bufferline_config.setup()
else
  vim.notify("Failed to load bufferline config", vim.log.levels.ERROR)
end


-- Nvim Tree
require('plug-settings.nvim-tree')
require('dap.js')
require('dap.dap-ui')

-- Ensure tsserver is set up for JavaScript and TypeScript React
require("lvim.lsp.manager").setup("tsserver", {
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
})

vim.opt.showtabline = 2



-- New Configurations
--
-- Top-level LunarVim config: load your modules in order

-- 1) Skip the built-in TailwindCSS LSP (we have our own in user/servers)
-- vim.list_extend(
--   lvim.lsp.automatic_configuration.skipped_servers,
--   { "tailwindcss" }
-- )

-- -- 2) Core settings & plugins
-- require("user.options")      -- editor options, folding, UI
-- require("user.gui")          -- colorscheme + GUI tweaks
-- require("user.keymaps")      -- your custom keymaps
-- require("user.plugins")      -- any extra plugin specs
-- require("user.treesitter")   -- TS parsers, highlighting, rainbow

-- -- 3) LSP servers, null-ls, and DAP
-- require("user.servers")      -- loads user/servers/init.lua
-- require("user.null-ls")      -- external formatters/linters as LSP
-- require("user.dap")          -- debug adapters

-- -- 4) File explorer & auto-commands
-- require("user.nvimtree")     -- NvimTree on_attach mappings
-- require("user.autocommands") -- any FileType or Buf* autocmds

