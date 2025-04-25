local null_ls = require("null-ls")

return {
  -- rustfmt for formatting
  null_ls.builtins.formatting.rustfmt,
  -- Clippy for linting
  null_ls.builtins.diagnostics.clippy.with({
    command = "cargo",
    args    = { "clippy", "--message-format=json" },
  }),
}
