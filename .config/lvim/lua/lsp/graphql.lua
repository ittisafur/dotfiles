local graphql_opts ={
  filetypes = {
      "vue",
      "javascript",
      "typescript",
      "typescriptreact",
      "javascriptreact",
      "javascript.jsx",
      "php",
  }
}
-- require("lvim.lsp.manager").setup("graphql", graphql_opts)
vim.list_extend(lvim.lsp.override, { "graphql" })

