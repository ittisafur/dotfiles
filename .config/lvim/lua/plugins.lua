lvim.plugins = {
  -- Testin Starts
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,  -- Ensure it is not lazily loaded
    build = ":TSUpdate",
  },
  -- DB Reader
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup({
        async_api_key_cmd = "~/.tokens/.nvim_openai"
      })
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
  },
  {
    "tpope/vim-dadbod"
  },
  -- DB UI
  {
    "kristijanhusak/vim-dadbod-ui"
  },
  { "mfussenegger/nvim-dap" },
  {
    "rcarriga/nvim-dap-ui",
  },
  {
    "theHamsta/nvim-dap-virtual-text"  
  },
  {
    "nvim-neotest/neotest",
  },
  -- Testin Ends
  { "anuvyklack/keymap-amend.nvim" },
  -- Search and replace across the project
  {
    'windwp/nvim-spectre'
  },
  {
    "tpope/vim-fugitive",
    cmd = {
      "G",
      "Git",
      "Gdiffsplit",
      "Gread",
      "Gwrite",
      "Ggrep",
      "GMove",
      "GDelete",
      "GBrowse",
      "GRemove",
      "GRename",
      "Glgrep",
      "Gedit"
    },
    ft = { "fugitive" }
  },
  {
    'olivercederborg/poimandres.nvim',
  },
  {
    "nvim-treesitter/nvim-tree-docs",
    config = function()
      require "nvim-treesitter.configs".setup {
        tree_docs = {
          enable = true,
        }
      }
    end
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      -- This is your opts table
      require("telescope").setup {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
              -- even more opts
            }
          }
        }
      }
      -- To get ui-select loaded and working with telescope, you need to call
      -- load_extension, somewhere after setup function:
      require("telescope").load_extension("ui-select")
    end
  },
  -- Folding plugin
  {
    "anuvyklack/pretty-fold.nvim",
    config = function()
      require('pretty-fold').setup()
      require('pretty-fold.preview').setup()
    end
  },
  -- Emmet Extention for Vim
  {
    "mattn/emmet-vim",
  },
  -- Forgot what this does
  {
    "mg979/vim-visual-multi"
  },
  -- Cheat as a dev plugin :)
  -- {
  --   "github/copilot.vim"
  -- },
  -- Basically shows definitions of functions and variables. Donno much
  {
    "ray-x/lsp_signature.nvim",
    event = "InsertEnter",
    config = function()
      require("lsp_signature").on_attach()
    end
  },
  -- Docs Suggested so yea. Need to look into it
  {
    "folke/trouble.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons" },  -- Replaced 'requires' with 'dependencies'
    cmd = "TroubleToggle",  -- Lazy load on 'TroubleToggle' command
  },
  -- JSDOC for Js and Ts
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
    event = "BufRead",
    config = function()
      vim.g.gitblame_message_template = '• <summary> • <date> • <author>'
      vim.g.gitblame_enabled = 1
      vim.g.gitblame_highlight_group = 'gitblame'
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    init = function()
      vim.g.indentLine_enabled = 1
      vim.g.indent_blankline_char = "▏"
      vim.g.indent_blankline_filetype_exclude = { "help", "terminal", "dashboard" }
      vim.g.indent_blankline_buftype_exclude = { "terminal" }
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
    config = function()
      require("colorizer").setup({ "*" }, {
        RGB = true,      -- #RGB hex codes
        RRGGBB = true,   -- #RRGGBB hex codes
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        names = true,
        rgb_fn = true,   -- CSS rgb() and rgba() functions
        hsl_fn = true,   -- CSS hsl() and hsla() functions
        css = true,      -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true,   -- Enable all CSS *functions*: rgb_fn, hsl_fn
      })
    end
  },
  {
    "metakirby5/codi.vim",
    cmd = "Codi",
  },
  {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function()
      require('neoscroll').setup({
        -- All these keys will be mapped to their corresponding default scrolling animation
        mappings = { '<C-u>', '<C-d>', '<C-b>',
          '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
        hide_cursor = true,          -- Hide cursor while scrolling
        stop_eof = true,             -- Stop at <EOF> when scrolling downwards
        use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
        respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
        easing_function = nil,       -- Default easing function
        pre_hook = nil,              -- Function to run before the scrolling animation starts
        post_hook = nil,             -- Function to run after the scrolling animation ends
      })
    end
  },
  {
    "npxbr/glow.nvim",
    ft = { "markdown" }
  },
  {
    "arnaud-lb/vim-php-namespace"
  },
  {
    "tpope/vim-surround",
    keys = { "c", "d", "y" },
    event = "BufRead"
  },
  {
    "lumiliet/vim-twig",
    ft = { "twig" }
  },
  {
    "othree/html5.vim",
    ft = { "html", "twig" }
  }
}

lvim.builtin.alpha.active = true    -- Enable alpha mode
lvim.builtin.dap.active = true      -- Debug Adapter Protocol
lvim.builtin.terminal.active = true -- Terminal
