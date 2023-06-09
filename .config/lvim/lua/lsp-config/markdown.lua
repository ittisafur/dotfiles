vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "marksman" })

local opts = {
  filetypes = { "markdown", "md", "mdx" },
}
require("lvim.lsp.manager").setup("marksman", opts)
