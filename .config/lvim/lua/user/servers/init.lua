lvim.lsp.installer.setup.ensure_installed = {
  -- Shell
  "bash-language-server",

  -- Frontend / Web
  "html-lsp",
  "css-lsp",
  "json-lsp",
  "lua-language-server",
  "typescript-language-server",
  "tailwindcss-language-server",
  "graphql-language-service-cli",
  "shopify-cli",
"shopify-theme-check",


  -- Frameworks
  "vue-language-server",
  "astro-language-server",  -- install if you work with Astro
  "svelte-language-server", -- for Svelte support
  "mdx-analyzer",           -- MDX support

  -- Backend
  "pyright",                -- Python
  "gopls",                  -- Go
  "rust-analyzer",          -- Rust
  "intelephense",           -- PHP
  "kotlin-language-server", -- Kotlin
  "gradle-language-server", -- Gradle
  "dcm",                    -- Dart

  -- Databases / ORM
  "prisma-language-server",
  "sqlls", -- SQL

  -- Infra / YAML
  "terraform-ls",               -- Terraform HCL
  "dockerfile-language-server", -- Dockerfiles
  "yaml-language-server",       -- YAML (incl. Kubernetes, GitHub Actions)

  -- Misc
  "bash-language-server",
  "clangd",        -- C / C++
  "rust-analyzer", -- Rust (repeat is fine)
  "lua-language-server",
  "marksman",      -- Markdown
  "vale-ls",       -- prose linting
}

-- 2) Skip any built-in tailwind you’re replacing
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "tailwindcss" })

-- 3) Require each server’s custom setup
--    (create one file per server in user/servers/)
local servers = {
  "bash",        -- bash-language-server
  "html",        -- html-lsp
  "css",         -- css-lsp
  "json",        -- json-lsp
  "lua",         -- lua-language-server
  "ts",          -- typescript-language-server & tsserver wrapper
  "tailwindcss", -- tailwindcss-language-server
  "graphql",     -- graphql-language-service-cli

  "vue",         -- vue-language-server
  "astro",       -- astro-language-server
  "svelte",      -- svelte-language-server
  "mdx",         -- mdx-analyzer

  "python",      -- pyright
  "go",          -- gopls
  "rust",        -- rust-analyzer
  "php",         -- intelephense
  "kotlin",      -- kotlin-language-server
  "gradle",      -- gradle-language-server
  "dcm",         -- dart

  "prisma",      -- prisma-language-server
  "sql",         -- sqlls

  "terraform",   -- terraform-ls
  "docker",      -- dockerfile-language-server
  "yaml",        -- yaml-language-server

  "clang",       -- clangd
  "markdown",    -- marksman
  "vale",        -- vale-ls
}

for _, name in ipairs(servers) do
  require("user.servers." .. name)
end
