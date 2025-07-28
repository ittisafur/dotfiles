-- Buffer-local settings
vim.opt_local.expandtab = true
vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4
vim.opt_local.softtabstop = 4
vim.opt_local.textwidth = 88
-- vim.opt_local.colorcolumn = "88"

-- Python-specific folding
-- vim.opt_local.foldmethod = "indent"
-- vim.opt_local.foldlevelstart = 99
-- vim.opt_local.foldenable = true

-- Enhanced null-ls formatters (keeping your existing black setup)
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
  {
    command = "black",
    filetypes = { "python" },
    args = {
      "--line-length=88",
      "--target-version=py38",
      "--stdin-filename", "$FILENAME",
      "--quiet", "-"
    },
  },
  {
    command = "isort",
    filetypes = { "python" },
    args = {
      "--profile=black",
      "--line-length=88",
      "--multi-line=3",
      "--trailing-comma",
      "--force-grid-wrap=0",
      "--combine-as",
      "--combine-star",
      "--stdout", "--filename", "$FILENAME", "-"
    },
  },
})

-- Optional: Additional linters if you want them
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
  {
    command = "mypy",
    filetypes = { "python" },
    args = {
      "--show-column-numbers",
      "--show-error-end",
      "--hide-error-codes",
      "--no-color-output",
      "--no-error-summary",
      "--no-pretty",
      "$FILENAME"
    },
  },
})

-- Python-specific keymaps (buffer-local)
local opts = { buffer = true, silent = true }

-- Quick run current file
vim.keymap.set("n", "<leader>pr", function()
  local file = vim.fn.expand("%:p")
  vim.cmd("split | terminal python " .. file)
end, vim.tbl_extend("force", opts, { desc = "Run Python file" }))

-- Quick run with arguments
vim.keymap.set("n", "<leader>pR", function()
  local file = vim.fn.expand("%:p")
  local args = vim.fn.input("Arguments: ")
  vim.cmd("split | terminal python " .. file .. " " .. args)
end, vim.tbl_extend("force", opts, { desc = "Run Python file with args" }))

-- Quick REPL
vim.keymap.set("n", "<leader>pi", function()
  vim.cmd("split | terminal python")
end, vim.tbl_extend("force", opts, { desc = "Open Python REPL" }))

-- Run tests with pytest
vim.keymap.set("n", "<leader>pt", function()
  local file = vim.fn.expand("%:p")
  vim.cmd("split | terminal python -m pytest " .. file .. " -v")
end, vim.tbl_extend("force", opts, { desc = "Run pytest on current file" }))

-- Python debugging setup (integrates with your DAP config)
local dap = require('dap')

-- Ensure Python DAP is configured
if not dap.adapters.python then
  dap.adapters.python = {
    type = 'executable',
    command = 'python',
    args = { '-m', 'debugpy.adapter' },
  }
end

-- Quick debug keymaps for Python
vim.keymap.set("n", "<leader>pdb", function()
  require('dap').run({
    type = 'python',
    request = 'launch',
    name = "Debug Current File",
    program = vim.fn.expand('%:p'),
    pythonPath = function()
      local venv = os.getenv("VIRTUAL_ENV")
      if venv then
        return venv .. "/bin/python"
      else
        return vim.fn.exepath("python3") or vim.fn.exepath("python")
      end
    end,
    console = "integratedTerminal",
    cwd = vim.fn.getcwd(),
  })
end, vim.tbl_extend("force", opts, { desc = "Debug current Python file" }))

-- Format on save for Python files
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.py",
  callback = function()
    -- Only format if LSP formatting is available
    if vim.lsp.buf.format then
      vim.lsp.buf.format({ async = false })
    end
  end,
  group = vim.api.nvim_create_augroup("PythonFormat", { clear = true }),
})

-- Auto-install common Python packages notification
local function check_common_packages()
  local packages = { "debugpy", "black", "isort", "mypy" }
  local missing = {}

  for _, pkg in ipairs(packages) do
    local status = vim.fn.system("python -c 'import " .. pkg .. "' 2>/dev/null")
    if vim.v.shell_error ~= 0 then
      table.insert(missing, pkg)
    end
  end

  if #missing > 0 then
    vim.notify(
      "Missing Python packages: " .. table.concat(missing, ", ") ..
      "\nRun: pip install " .. table.concat(missing, " "),
      vim.log.levels.WARN
    )
  end
end

-- Check packages when opening Python files (only once per session)
if not vim.g.python_packages_checked then
  vim.defer_fn(check_common_packages, 1000)
  vim.g.python_packages_checked = true
end

-- Python-specific which-key mappings
if lvim.builtin.which_key then
  lvim.builtin.which_key.mappings["p"] = {
    name = "Python",
    r = { "<cmd>lua vim.cmd('split | terminal python ' .. vim.fn.expand('%:p'))<cr>", "Run File" },
    R = { "<cmd>lua local args = vim.fn.input('Args: '); vim.cmd('split | terminal python ' .. vim.fn.expand('%:p') .. ' ' .. args)<cr>", "Run with Args" },
    i = { "<cmd>split | terminal python<cr>", "Interactive REPL" },
    t = { "<cmd>split | terminal python -m pytest % -v<cr>", "Run Tests" },
    d = { function() vim.cmd("PyDiagnostic") end, "Environment Diagnostic" },
    s = { function() vim.cmd("PyRestart") end, "Restart LSP" },
    db = { function()
      require('dap').run({
        type = 'python',
        request = 'launch',
        name = "Debug Current File",
        program = vim.fn.expand('%:p'),
        console = "integratedTerminal",
      })
    end, "Debug File" },
  }
end

-- Set up Python-specific commenting
vim.api.nvim_buf_set_option(0, "commentstring", "# %s")

-- Enhanced syntax highlighting for Python
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    -- Enable semantic highlighting if available
    for _, client in pairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
      if client.name == "pyright" and client.server_capabilities.semanticTokensProvider then
        vim.lsp.semantic_tokens.start(0, client.id)
        break
      end
    end
  end,
})

-- Python docstring templates (basic)
vim.keymap.set("n", "<leader>pd", function()
  local row = vim.api.nvim_win_get_cursor(0)[1]
  local docstring = {
    '"""',
    'Brief description.',
    '',
    'Args:',
    '    param1: Description',
    '',
    'Returns:',
    '    Description',
    '',
    'Raises:',
    '    Exception: Description',
    '"""'
  }
  vim.api.nvim_buf_set_lines(0, row, row, false, docstring)
end, vim.tbl_extend("force", opts, { desc = "Insert docstring template" }))
