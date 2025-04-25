local util = require("lspconfig.util")

-- helper: do we have tailwindcss in package.json?
local function has_pkg_dep(name)
  local pkg_path = vim.fn.getcwd() .. "/package.json"
  if vim.fn.filereadable(pkg_path) == 0 then return false end
  local pkg = vim.fn.json_decode(vim.fn.readfile(pkg_path))
  return (pkg.dependencies and pkg.dependencies[name])
      or (pkg.devDependencies and pkg.devDependencies[name])
end

-- helper: do we have a tailwind.config.* file?
local function has_config_file()
  return util.root_pattern(
    "tailwind.config.js",
    "tailwind.config.cjs",
    "tailwind.config.mjs",
    "tailwind.config.ts"
  )(vim.loop.cwd()) ~= nil
end

-- do we enable Tailwind LSP here?
local function project_has_tailwind()
  return has_pkg_dep("tailwindcss") or has_config_file()
end

if project_has_tailwind() then
  require("lvim.lsp.manager").setup("tailwindcss", {
    filetypes = {
      "html", "css", "scss",
      "javascript", "javascriptreact",
      "typescript", "typescriptreact",
      "astro", "svelte", "vue", "mdx",
    },
    root_dir = function(fname)
      return util.root_pattern(
        "tailwind.config.js",
        "tailwind.config.cjs",
        "tailwind.config.mjs",
        "tailwind.config.ts",
        "postcss.config.js",
        "postcss.config.mjs",
        "package.json"
      )(fname)
    end,
    on_attach = function(_, bufnr)
      vim.notify(" TailwindCSS LSP attached", vim.log.levels.INFO)
    end,
  })
else
  vim.list_extend(
    lvim.lsp.automatic_configuration.skipped_servers,
    { "tailwindcss" }
  )
end
