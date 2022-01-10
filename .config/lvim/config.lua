-- General Settings
require('general')

-- Gui Settings
require('gui.gui-general')

-- Dashboard Settings
require('plug-settings.dashboard')

-- ColorScheme
-- require('themes.tokyonight')
require('themes.nord')

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

-- Emmet Ls Settings
require('plug-settings.emmet')

-- Tailwindcss Settings
require('plug-settings.tailwindcss')


-- Autocommands
require('autocommands').config()
-- Which Keys
require('plug-settings.whichkey')

-- Nvim Tree
-- require('plug-settings.nvim-tree')
