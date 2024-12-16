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
-- require('lsp.graphql')
require('lsp.shopify')
require('lsp-config.markdown')

-- Emmet Ls Settings
require('plug-settings.emmet')

-- Tailwindcss Settings
require('plug-settings.tailwindcss')
require('lsp.rust')


-- Autocommands
require('autocommands')
-- Which Keys
require('plug-settings.whichkey')
lvim.builtin.which_key.setup.plugins.presets.z = true

-- Nvim Tree
-- require('plug-settings.nvim-tree')
require('dap.js')
require('dap.dap-ui')

-- Ensure tsserver is set up for JavaScript and TypeScript React
require("lvim.lsp.manager").setup("tsserver", {
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
})

-- Setup Tailwind CSS LSP
require("lvim.lsp.manager").setup("tailwindcss")
