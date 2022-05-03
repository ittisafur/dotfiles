-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "html",
  "css",
  "rasi",
  "scss",
  "graphql",
  "javascript",
  "typescript",
  "tsx",
  "vue",
  "svelte",
  "json",
  "jsdoc",
  "lua",
  "python",
  "regex",
  "rust",
  "yaml",
  "php",
  "solidity",
  "java",
  "go",
  "dart",
  "markdown",
  "dockerfile",
  "comment",
  "todotxt",
  "dot",
  "make",
  "http"
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- nvim-ts-rainbow settings
lvim.builtin.treesitter.rainbow = {
  enable = true,
  extended_mode = true,
}
