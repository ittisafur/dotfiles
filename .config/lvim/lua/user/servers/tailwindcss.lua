local util = require("lspconfig.util")

-- detect if tailwind is in package.json
local function has_pkg_dep(name)
  local pkg = vim.fn.json_decode(vim.fn.readfile("package.json", nil, true) or "{}")
  return (pkg.dependencies  and pkg.dependencies[name])
      or (pkg.devDependencies and pkg.devDependencies[name])
end

-- detect if there's a tailwind.config.* file
local function has_config_file()
  return util.root_pattern(
    "tailwind.config.js",
    "tailwind.config.cjs",
    "tailwind.config.mjs",
    "tailwind.config.ts"
  )(vim.loop.cwd()) ~= nil
end

if has_pkg_dep("tailwindcss") or has_config_file() then
  require("lvim.lsp.manager").setup("tailwindcss", {
    cmd      = { "tailwindcss-language-server", "--stdio" },
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
    on_attach = function(_,
