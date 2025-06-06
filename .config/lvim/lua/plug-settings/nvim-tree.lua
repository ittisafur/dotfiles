-- require'nvim-tree'.setup{
--   disable_netrw       = true,
--   hijack_netrw        = true,
--   open_on_setup       = false,
--   ignore_ft_on_setup  = {},
--   auto_close          = false,
--   open_on_tab         = false,
--   hijack_cursor       = false,
--   update_cwd          = false,
--   update_to_buf_dir   = {
--     enable = true,
--     auto_open = true,
--   },
--   diagnostics = {
--     enable = false,
--     icons = {
--       hint = "",
--       info = "",
--       warning = "",
--       error = "",
--     }
--   },
--   update_focused_file = {
--     enable      = false,
--     update_cwd  = false,
--     ignore_list = {}
--   },
--   system_open = {
--     cmd  = nil,
--     args = {}
--   },
--   filters = {
--     dotfiles = true,
--     custom = {}
--   },
--   git = {
--     enable = true,
--     ignore = false,
--     timeout = 500,
--   },
--   view = {
--     width = 30,
--     height = 30,
--     hide_root_folder = false,
--     side = 'left',
--     auto_resize = false,
--     mappings = {
--       custom_only = false,
--       list = {}
--     },
--     number = false,
--     relativenumber = false
--   },
--   trash = {
--     cmd = "trash",
--     require_confirm = true
--   }
-- }


vim.api.nvim_create_autocmd("FileType", {
  pattern = "NvimTree",
  callback = function()
    vim.cmd([[
      nnoremap <buffer> <CR> :lua require'nvim-tree.api'.node.open.tab()<CR>
    ]])
  end,
})
