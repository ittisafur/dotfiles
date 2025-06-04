# Ittisafur's Config Guide

---

## 📁 Directory Structure

```text
~/.config/lvim/
└── lua/user/
    ├── init.lua           # entrypoint: loads everything in order
    ├── options.lua        # core vim.opt & lvim.* settings
    ├── gui.lua            # colorscheme, transparency, highlight tweaks
    ├── keymaps.lua        # your custom key mappings
    ├── plugins.lua        # extra plugin specs or overrides
    ├── treesitter.lua     # ensure_installed parsers, highlight, rainbow
    ├── servers/           # LSP configs (one file per language)
    │   ├── init.lua       # Mason ensure_installed + load each server module
    │   ├── tailwindcss.lua
    │   ├── rust.lua
    │   ├── graphql.lua
    │   └── …              # add new `<lang>.lua` here
    ├── null-ls/           # null-ls sources (formatters, linters, actions)
    │   ├── init.lua
    │   ├── shopify.lua
    │   ├── python.lua
    │   └── rust.lua
    ├── dap/               # nvim-dap adapters + configs
    │   ├── init.lua
    │   ├── js.lua
    │   ├── python.lua
    │   ├── go.lua
    │   ├── dart.lua
    │   └── codelldb.lua
    ├── nvimtree.lua       # nvim-tree on_attach & view settings
    └── autocommands.lua   # any Vim autocmds you want


### Color Schemes

[Neon](https://github.com/rafamadriz/neon)
[Nightfly](https://github.com/bluz71/vim-nightfly-guicolors)
[Sonokai](https://github.com/sainnhe/sonokai)
[Edge](https://github.com/sainnhe/edge)
[Papadark](https://github.com/MordechaiHadad/nvim-papadark)
[Gruvbox MaMaterial](https://github.com/sainnhe/gruvbox-material)
[Doom one](https://github.com/NTBBloodbath/doom-one.nvim)
[Vim](https://github.com/dracula/vim)
[Calvera](https://github.com/yashguptaz/calvera-dark.nvim)
[Calvera](https://github.com/yashguptaz/calvera-dark.nvim)
[Night Fox](https://github.com/EdenEast/nightfox.nvim)
```
