
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


-- Autocommands
require('autocommands')
-- Which Keys
require('plug-settings.whichkey')

-- Nvim Tree
-- require('plug-settings.nvim-tree')
