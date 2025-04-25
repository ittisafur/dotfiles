-- local opts = {
--   tools = {
--     inlay_hints = {
--       auto = true,
--       show_parameter_hints = true,
--     },
--   },
--   server = {
--     root_dir = function(fname)
--       local util = require('lspconfig.util')
--       -- Look for Cargo.toml in src-tauri directory
--       return util.root_pattern('src-tauri/Cargo.toml')(fname)
--           or util.root_pattern('Cargo.toml')(fname)
--     end,
--     settings = {
--       ["rust-analyzer"] = {
--         checkOnSave = {
--           command = "clippy",
--         },
--         cargo = {
--           loadOutDirsFromCheck = true,
--         },
--       },
--     },
--   },
-- }

-- require("lvim.lsp.manager").setup("rust_analyzer", opts)
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "rust_analyzer" })

local opts = {
  tools = {
    inlay_hints = {
      auto = true,
      show_parameter_hints = true,
    },
  },
  server = {
    root_dir = require('lspconfig.util').find_git_ancestor,
    settings = {
      ["rust-analyzer"] = {
        cargo = {
          allFeatures = true,
        },
        checkOnSave = {
          command = "clippy",
        },
        procMacro = {
          enable = true,
        },
      },
    },
  },
}

require("lvim.lsp.manager").setup("rust_analyzer", opts)
