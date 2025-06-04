local actions = require("telescope.actions")

lvim.builtin.telescope.on_config_done = function()
  local m = lvim.builtin.telescope.defaults.mappings.i
  print('Telescope Loaded')
  -- navigation
  m["<C-j>"] = actions.move_selection_next
  m["<C-k>"] = actions.move_selection_previous
  m["<C-n>"] = actions.cycle_history_next
  m["<C-p>"] = actions.cycle_history_prev

  -- <CR> opens in a **new tab**
  m["<CR>"] = actions.select_tab

  -- optional: horizontal / vertical splits
  m["<C-x>"] = actions.file_split  -- horizontal
  m["<C-v>"] = actions.file_vsplit -- vertical
end

-- keep your CTRL+F binding
vim.keymap.set("n", "<C-f>", "<cmd>Telescope find_files<cr>", { silent = true })


-- show hidden files when running a find command in telescope
-- lvim.builtin.telescope.pickers = { find_files = { hidden = true } }
-- lvim.builtin.telescope.pickers = { find_files = {find_command = { "rg", "--files", "--follow", "--hidden" }}}
