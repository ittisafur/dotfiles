lvim.builtin.telescope.on_config_done = function()
  local actions = require "telescope.actions"
  lvim.builtin.telescope.defaults.mappings.i["<C-j>"] = actions.move_selection_next
  lvim.builtin.telescope.defaults.mappings.i["<C-k>"] = actions.move_selection_previous
  lvim.builtin.telescope.defaults.mappings.i["<C-n>"] = actions.cycle_history_next
  lvim.builtin.telescope.defaults.mappings.i["<C-p>"] = actions.cycle_history_prev
end

-- Change Telescope find_files with CTRL + F
vim.api.nvim_set_keymap("n", "<C-f>", ":Telescope find_files<cr>", { noremap = true, silent = true })

-- show hidden files when running a find command in telescope
-- lvim.builtin.telescope.pickers = { find_files = { hidden = true } }
-- lvim.builtin.telescope.pickers = { find_files = {find_command = { "rg", "--files", "--follow", "--hidden" }}}


