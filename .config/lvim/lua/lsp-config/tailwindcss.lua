local function is_in_package_json(field)
	local path = vim.fn.getcwd() .. "/package.json"
	if vim.fn.filereadable(path) == 0 then return false end

	local ok, content = pcall(vim.fn.readfile, path)
	if not ok then return false end

	local package_json = vim.fn.json_decode(content)
	if not package_json then return false end

	if package_json[field] then return true end
	if package_json.devDependencies and package_json.devDependencies[field] then return true end
	if package_json.dependencies and package_json.dependencies[field] then return true end

	return false
end

local function has_tailwind_config()
	return vim.fn.filereadable("tailwind.config.js") == 1
		or vim.fn.filereadable("tailwind.config.ts") == 1
end

local function project_has_tailwindcss_dependency()
	return is_in_package_json("tailwindcss") or has_tailwind_config()
end

-- LSP Setup
if project_has_tailwindcss_dependency() then
	print("✅ Tailwind CSS detected in project. Starting LSP setup...")

	require("lvim.lsp.manager").setup("tailwindcss", {
		filetypes = {
			"html", "css",
			"javascript", "javascriptreact",
			"typescript", "typescriptreact",
		},
	})

else
	print("❌ Tailwind CSS not found. Skipping setup.")
	table.insert(lvim.lsp.automatic_configuration.skipped_servers, "tailwindcss")
end
