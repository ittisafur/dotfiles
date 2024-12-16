-- Trouble Keys
lvim.builtin.which_key.mappings["t"] = {
  name = "Diagnostics",
  t = { "<cmd>TroubleToggle<cr>", "trouble" },
  w = { "<cmd>TroubleToggle lsp_workspace_diagnostics<cr>", "workspace" },
  d = { "<cmd>TroubleToggle lsp_document_diagnostics<cr>", "document" },
  q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
  l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
  r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
}
-- JsDoc and PhpDoc Modded
lvim.builtin.which_key.mappings["D"] = {
  name = "Doc Block",
  j = {"<cmd>JsDoc<cr>", "Js Doc Block"},
  p = {"<cmd>call PhpDocSingle()<cr>", "Php Doc Single"}
}

-- Zen Mode
lvim.builtin.which_key.mappings["z"] = {
  name = "zen mode",
  m = {"<cmd>ZenMode<cr>", "zen mode"}
}

-- Copilot
lvim.builtin.which_key.mappings["C"] = {
  name = "Copilot",
  e = {"<cmd>Copilot enable<cr>", "Enable Copilot"},
  d = {"<cmd>Copilot disable<cr>", "Diable Copilot"}
}


lvim.builtin.which_key.mappings["d"] = {
  name = "Debug",
  t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
  c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
  i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
  o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
  u = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI" },
  x = { "<cmd>lua require'dap'.terminate()<cr>", "Terminate" },
  r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle REPL" },
}
