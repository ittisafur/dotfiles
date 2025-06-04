-- Core settings & plugins
require("user.options")    -- editor options, folding, UI
require("user.gui")        -- colorscheme + GUI tweaks
require("user.keymaps")    -- your custom keymaps
require("user.plugins")    -- any extra plugin specs
require("user.treesitter") -- TS parsers, highlighting, rainbow

-- LSP servers, Null-ls, and DAP
require("user.servers") -- loads user/servers/init.lua
-- require("user.null-ls") -- external formatters/linters as LSP
require("user.dap")     -- debug adapters

-- File explorer & auto-commands
require("user.nvimtree")     -- NvimTree on_attach mappings
require("user.autocommands") -- any FileType or Buf* autocmds

-- Plugin Configuraitons
require("user.pluginsetup")
