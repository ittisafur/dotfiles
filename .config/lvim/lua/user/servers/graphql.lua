local util = require("lspconfig.util")

-- check package.json for a “graphql” dependency
local function has_graphql_dep()
  local ok, pkg = pcall(vim.fn.json_decode, vim.fn.readfile("package.json", nil, true))
  if not ok or type(pkg) ~= "table" then return false end
  return (pkg.dependencies  and pkg.dependencies.graphql)
      or (pkg.devDependencies and pkg.devDependencies.graphql)
end

-- root detection: either a config file or a package.json with graphql
local function root_dir(fname)
  local root = util.root_pattern(
    ".graphqlconfig", ".graphqlrc.js", ".graphqlrc.json",
    ".graphqlrc.yaml", ".git"
  )(fname)
  if not root then return nil end
  return has_graphql_dep() and root or nil
end

if root_dir(vim.fn.expand("%:p")) then
  require("lvim.lsp.manager").setup("graphql", {
    cmd       = { "graphql-lsp", "server", "-m", "stream" },
    filetypes = {
      "graphql", "javascript", "javascriptreact",
      "typescript", "typescriptreact",
    },
    root_dir  = root_dir,
    on_attach = function(_, bufnr)
      vim.notify("🚀 GraphQL LSP attached", vim.log.levels.INFO)
    end,
  })
else
  -- skip if no GraphQL in this project
  vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "graphql" })
end
