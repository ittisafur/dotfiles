
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

-- If you want to ignore certain parsers
lvim.builtin.treesitter.ignore_install = { "haskell" }

-- Enable Tree-sitter based highlighting
lvim.builtin.treesitter.highlight.enable = true
lvim.builtin.treesitter.highlight.additional_vim_regex_highlighting = false

-- Enable nvim-ts-rainbow (if you use it for rainbow parentheses)
lvim.builtin.treesitter.rainbow = {
  enable = true,
  extended_mode = true,
}
