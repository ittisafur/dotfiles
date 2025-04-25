-- Marksman for Markdown/MDX
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "marksman" })

require("lvim.lsp.manager").setup("marksman", {
  filetypes = { "markdown", "md", "mdx" },
})
