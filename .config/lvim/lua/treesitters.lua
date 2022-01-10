-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "javascript",
  "json",
  "jsdoc",
  "lua",
  "python",
  "typescript",
  "tsx",
  "vue",
  "html",
  "css",
  "scss",
  "regex",
  "rust",
  "yaml",
  "php",
  "graphql"
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- nvim-ts-rainbow settings
lvim.builtin.treesitter.rainbow = {
  enable = true,
  extended_mode = true,
}
