local util = require("lspconfig.util")

-- Function to detect Python interpreter
local function get_python_path()
  -- Try virtual environment first
  local venv_path = os.getenv("VIRTUAL_ENV")
  if venv_path then
    return venv_path .. "/bin/python"
  end

  -- Try conda environment
  local conda_prefix = os.getenv("CONDA_PREFIX")
  if conda_prefix then
    return conda_prefix .. "/bin/python"
  end

  -- Try poetry
  local handle = io.popen("poetry env info --path 2>/dev/null")
  if handle then
    local result = handle:read("*l")
    handle:close()
    if result and result ~= "" then
      return result .. "/bin/python"
    end
  end

  -- Try pipenv
  local pipenv_handle = io.popen("pipenv --venv 2>/dev/null")
  if pipenv_handle then
    local pipenv_result = pipenv_handle:read("*l")
    pipenv_handle:close()
    if pipenv_result and pipenv_result ~= "" then
      return pipenv_result .. "/bin/python"
    end
  end

  -- Fallback to system Python
  return vim.fn.exepath("python3") or vim.fn.exepath("python") or "python"
end

-- Enhanced Pyright configuration
require("lvim.lsp.manager").setup("pyright", {
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },
  root_dir = util.root_pattern(
    ".git",
    "setup.py",
    "setup.cfg",
    "pyproject.toml",
    "requirements.txt",
    "Pipfile",
    "pyrightconfig.json"
  ),
  single_file_support = true,
  settings = {
    python = {
      pythonPath = get_python_path(),
      analysis = {
        typeCheckingMode = "basic", -- "off", "basic", "strict"
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        autoImportCompletions = true,
        diagnosticMode = "workspace", -- "openFilesOnly" or "workspace"
        diagnosticSeverityOverrides = {
          reportMissingImports = "information",
          reportMissingTypeStubs = "information",
          reportUnusedImport = "information",
          reportUnusedVariable = "information",
          reportGeneralTypeIssues = "warning",
        },
      },
    },
  },
  capabilities = vim.tbl_deep_extend("force",
    require("lvim.lsp").common_capabilities(),
    {
      textDocument = {
        completion = {
          completionItem = {
            snippetSupport = true,
          },
        },
      },
    }
  ),
  on_attach = function(client, bufnr)
    require("lvim.lsp").common_on_attach(client, bufnr)

    -- Python-specific keymaps
    local opts = { buffer = bufnr, silent = true }
    vim.keymap.set("n", "<leader>lo", "<cmd>PyrightOrganizeImports<cr>",
      vim.tbl_extend("force", opts, { desc = "Organize Imports" }))

    -- Auto-organize imports on save (optional)
    if client.server_capabilities.codeActionProvider then
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        group = vim.api.nvim_create_augroup("PyAutoImports", { clear = true }),
        callback = function()
          vim.lsp.buf.code_action({
            context = { only = { "source.organizeImports" } },
            apply = true,
          })
        end,
      })
    end

    vim.notify("🐍 Pyright LSP attached", vim.log.levels.INFO)
  end,
})

-- Enhanced Ruff configuration (for linting and formatting)
require("lvim.lsp.manager").setup("ruff", {
  cmd = { "ruff", "server", "--preview" },
  filetypes = { "python" },
  root_dir = util.root_pattern(
    ".git",
    "setup.py",
    "setup.cfg",
    "pyproject.toml",
    "requirements.txt",
    "Pipfile",
    "ruff.toml",
    ".ruff.toml"
  ),
  single_file_support = true,
  init_options = {
    settings = {
      -- Ruff configuration
      lint = {
        enable = true,
        select = {
          "E",  -- pycodestyle errors
          "W",  -- pycodestyle warnings
          "F",  -- pyflakes
          "I",  -- isort
          "B",  -- flake8-bugbear
          "C4", -- flake8-comprehensions
          "UP", -- pyupgrade
          "N",  -- pep8-naming
        },
        ignore = {
          "E501", -- line too long (handled by formatter)
          "B008", -- function call in argument defaults
          "N812", -- lowercase imported as non-lowercase
        },
      },
      format = {
        enable = true,
        args = {
          "--line-length=88",
          "--target-version=py38",
        },
      },
    },
  },
  on_attach = function(client, bufnr)
    require("lvim.lsp").common_on_attach(client, bufnr)

    -- Disable hover in favor of Pyright
    client.server_capabilities.hoverProvider = false

    vim.notify("⚡ Ruff LSP attached", vim.log.levels.INFO)
  end,
})

-- Create diagnostic command for Python environment
vim.api.nvim_create_user_command("PyDiagnostic", function()
  local python_path = get_python_path()
  local cwd = vim.fn.getcwd()

  print("=== Python Environment Diagnostic ===")
  print("Working directory: " .. cwd)
  print("Python path: " .. python_path)
  print("Virtual env: " .. (os.getenv("VIRTUAL_ENV") or "none"))
  print("Conda env: " .. (os.getenv("CONDA_PREFIX") or "none"))

  -- Check for common packages
  local packages = { "dotenv", "pydantic", "requests", "flask", "django", "fastapi" }
  print("\n=== Package Status ===")
  for _, pkg in ipairs(packages) do
    local status = vim.fn.system("python -c 'import " .. pkg .. "; print(\"✓\")' 2>/dev/null"):gsub("\n", "")
    print(pkg .. ": " .. (status == "✓" and "✓ installed" or "✗ not found"))
  end

  -- Check for Python config files
  print("\n=== Config Files ===")
  local config_files = {
    "pyproject.toml",
    "pyrightconfig.json",
    "setup.py",
    "requirements.txt",
    "Pipfile",
    "ruff.toml",
    ".ruff.toml"
  }

  for _, file in ipairs(config_files) do
    local exists = vim.fn.filereadable(file) == 1
    print(file .. ": " .. (exists and "✓ found" or "✗ not found"))
  end
end, { desc = "Diagnose Python environment and LSP setup" })

-- Quick command to restart Python LSP servers
vim.api.nvim_create_user_command("PyRestart", function()
  vim.cmd("LspRestart pyright")
  vim.cmd("LspRestart ruff")
  vim.notify("🔄 Restarted Python LSP servers", vim.log.levels.INFO)
end, { desc = "Restart Python LSP servers" })
