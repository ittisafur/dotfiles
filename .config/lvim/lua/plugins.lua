lvim.plugins = {
  -- Eth Solidiy
  {
    "ChristianChiarulli/vim-solidity"
  },
  {
    "mattn/emmet-vim",
  },
  {
    "mg979/vim-visual-multi"
  },
  {
    "tzachar/cmp-tabnine",
    run = "./install.sh",
    requires = "hrsh7th/nvim-cmp",
    event = "InsertEnter",
  },
  {
    "github/copilot.vim"
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "InsertEnter",
    config = function()
      require("lsp_signature").on_attach()
    end
  },
  {
    "folke/trouble.nvim",
     cmd = "TroubleToggle",
  },
  {
    "heavenshell/vim-jsdoc",
  },
  {
    "Rican7/php-doc-modded"
  },
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end,
  },
  {
    "f-person/git-blame.nvim",
    config = function()
      vim.g.gitblame_message_template ='<summary> • <date> • <author>'
      vim.g.gitblame_enabled = 0
      vim.g.gitblame_highlight_group = 'LineNr'
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    setup = function()
      vim.g.indentLine_enabled = 1
      vim.g.indent_blankline_char = "▏"
      vim.g.indent_blankline_filetype_exclude = {"help", "terminal", "dashboard"}
      vim.g.indent_blankline_buftype_exclude = {"terminal"}
      vim.g.indent_blankline_show_trailing_blankline_indent = false
      vim.g.indent_blankline_show_first_indent_level = true
    end
  },
  -- Treesitters Plugin Start
  {
    "p00f/nvim-ts-rainbow",
  },
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  -- Treesitters Plugin End
  {
    -- Tokyo night colorscheme
    "folke/tokyonight.nvim"
  },
  {
    "shaunsingh/nord.nvim"
  },
  {
    "folke/zen-mode.nvim",
    config = function()
      require("plug-settings.zenmode").config()
    end,
  },
  {
    "rose-pine/neovim",
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function ()
      require("colorizer").setup({ "*" }, {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        names = true,
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
      })
    end
  },
  {
    "metakirby5/codi.vim",
     cmd = "Codi",
  },
  { "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function()
    require('neoscroll').setup({
          -- All these keys will be mapped to their corresponding default scrolling animation
          mappings = {'<C-u>', '<C-d>', '<C-b>',
          '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
          hide_cursor = true,          -- Hide cursor while scrolling
          stop_eof = true,             -- Stop at <EOF> when scrolling downwards
          use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
          respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
          cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
          easing_function = nil,        -- Default easing function
          pre_hook = nil,              -- Function to run before the scrolling animation starts
          post_hook = nil,              -- Function to run after the scrolling animation ends
          })
      end
  },
  {
    "npxbr/glow.nvim",
    ft = {"markdown"}
  },
  {
    "arnaud-lb/vim-php-namespace"
  },
  {
    "tpope/vim-surround",
    keys = {"c", "d", "y"},
    event = "BufRead"
  }
}
