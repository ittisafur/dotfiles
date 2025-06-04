local M = {}

print("✅ bufferline.lua loaded")

M.setup = function()
  local bufferline = require("bufferline")
  local groups = require("bufferline.groups")

  bufferline.setup {
    options = {
      mode = "buffers",
      themable = true,
      style_preset = bufferline.style_preset.default,
      separator_style = "thin",
      indicator = {
        icon = "",
        style = "underline",
      },
      always_show_bufferline = true,
      auto_toggle_bufferline = false,

      close_command = "bdelete! %d",
      right_mouse_command = "bdelete! %d",
      left_mouse_command = "buffer %d",
      buffer_close_icon = "󰅖",
      modified_icon = "●",
      close_icon = "",
      show_buffer_close_icons = true,
      show_close_icon = false,
      show_tab_indicators = true,

      diagnostics = "nvim_lsp",
      diagnostics_indicator = function(count, level)
        local icon = level:match("error") and " " or ""
        return " " .. icon .. count
      end,

      -- Show filenames only
      name_formatter = function(buf)
        return vim.fn.fnamemodify(buf.name, ":t")
      end,

      -- Pinning groups
      groups = {
        items = {
          groups.builtin.pinned:with({ icon = "" }),
        },
      },

      offsets = {
        {
          filetype = "NvimTree",
          text = "Explorer",
          text_align = "left",
          highlight = "Directory",
          separator = true,
        },
      },

      hover = {
        enabled = true,
        delay = 150,
        reveal = { "close" },
      },

      persist_buffer_sort = true,
      sort_by = "insert_after_current",
    }
  }

  -- Bufferline Mappings
  local map = vim.keymap.set
  local opts = { noremap = true, silent = true, desc = "" }

  map("n", "<leader>bp", "<cmd>BufferLineTogglePin<CR>", { desc = "Toggle Pin" })
  map("n", "<leader>b[", "<cmd>BufferLineMovePrev<CR>", { desc = "Move Left" })
  map("n", "<leader>b]", "<cmd>BufferLineMoveNext<CR>", { desc = "Move Right" })
  map("n", "<leader>bs", "<cmd>BufferLineSortByExtension<CR>", { desc = "Sort by Extension" })
  map("n", "<leader>bd", "<cmd>BufferLineSortByDirectory<CR>", { desc = "Sort by Directory" })
  map("n", "<leader>bo", "<cmd>BufferLineCloseOthers<CR>", { desc = "Close Others" })
  map("n", "<leader>bl", "<cmd>BufferLineCloseLeft<CR>", { desc = "Close Left" })
  map("n", "<leader>br", "<cmd>BufferLineCloseRight<CR>", { desc = "Close Right" })
end

return M
