--  Let your tailwind.lua decide if it should attach or skip
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "tailwindcss" })

-- Manually require each module, but pcall ensures “module not found” is silently ignored.
pcall(require, "user.servers.rust")        -- lua/user/servers/rust.lua
pcall(require, "user.servers.shopify")     -- lua/user/servers/shopify.lua
pcall(require, "user.servers.markdown")    -- lua/user/servers/lua.lua
pcall(require, "user.servers.tailwindcss") -- lua/user/servers/tailwindcss.lua
pcall(require, "user.servers.graphql")     -- lua/user/servers/graphql.lua
