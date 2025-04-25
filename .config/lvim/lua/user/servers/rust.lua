local util = require("lspconfig.util")

local opts = {
  tools = {
    inlay_hints = {
      auto                 = true,
      show_parameter_hints = true,
    },
  },
  server = {
    cmd = { "rust-analyzer" },
    root_dir = function(fname)
      -- pick up Tauri or plain Cargo projects
      return util.root_pattern("src-tauri/Cargo.toml")(fname)
          or util.root_pattern("Cargo.toml")(fname)
    end,
    settings = {
      ["rust-analyzer"] = {
        cargo       = { allFeatures = true },
        checkOnSave = { command = "clippy" },
        procMacro   = { enable = true },
      },
    },
  },
}

require("lvim.lsp.manager").setup("rust_analyzer", opts)
