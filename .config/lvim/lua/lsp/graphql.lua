require("lvim.lsp.manager").setup("graphql", {
  cmd = { "graphql-lsp", "server", "-m", "stream" },
  filetypes = { "graphql", "javascript", "javascriptreact", "typescript", "typescriptreact" },
  root_dir = require("lspconfig.util").root_pattern(".git", "package.json", ".graphqlconfig", ".graphqlrc"),
})
