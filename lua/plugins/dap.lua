local ok_dap, dap = pcall(require, "dap")
if not ok_dap then return end

-- UI só carregada quando existir
local function get_dapui()
  local ok, dapui = pcall(require, "dapui")
  if ok then return dapui end
  return nil
end

-- Mason DAP
require("mason").setup()

require("mason-nvim-dap").setup({
  ensure_installed = {
    "delve",
    "debugpy",
    "cpptools",
    "js-debug-adapter",
  },
  automatic_installation = true,
})

-- DAP UI setup (seguro)
local ok_ui, dapui = pcall(require, "dapui")
if ok_ui then
  dapui.setup({
    icons = {
      expanded = "▾",
      collapsed = "▸",
      current_frame = "*",
    },
  })

  dap.listeners.after.event_initialized["dapui"] = function()
    dapui.open()
  end

  dap.listeners.before.event_terminated["dapui"] = function()
    dapui.close()
  end

  dap.listeners.before.event_exited["dapui"] = function()
    dapui.close()
  end
end

-- Signs
vim.api.nvim_set_hl(0, "DapBreakpointRed", { fg = "#F93D3D" })
vim.api.nvim_set_hl(0, "DapBreakpointGreen", { fg = "#36D93E" })

vim.fn.sign_define("DapBreakpoint", {
  text = "●",
  texthl = "DapBreakpointRed",
})

vim.fn.sign_define("DapBreakpointCondition", {
  text = "●",
  texthl = "DapBreakpointGreen",
})

vim.fn.sign_define("DapStopped", {
  text = "▶",
  texthl = "DapBreakpointGreen",
})

-- C / C++ / Rust
local cpp_config = {
  {
    name = "Launch file",
    type = "cpptools",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopAtEntry = true,
  },
}

dap.configurations.cpp = cpp_config
dap.configurations.c = cpp_config
dap.configurations.rust = cpp_config

-- JS / TS
for _, lang in ipairs({
  "javascript",
  "typescript",
  "javascriptreact",
  "typescriptreact",
}) do
  dap.configurations[lang] = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
    },
  }
end

-- Go
local ok_go, dap_go = pcall(require, "dap-go")
if ok_go then
  dap_go.setup({
    delve = {
      initialize_timeout_sec = 20,
    },
  })
end

-- Keymaps
vim.keymap.set("n", "<F5>", dap.continue, { desc = "DAP Continue" })
vim.keymap.set("n", "<F1>", dap.step_into, { desc = "DAP Step Into" })
vim.keymap.set("n", "<F2>", dap.step_over, { desc = "DAP Step Over" })
vim.keymap.set("n", "<F3>", dap.step_out, { desc = "DAP Step Out" })
vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "DAP Toggle Breakpoint" })

vim.keymap.set("n", "<leader>B", function()
  dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "DAP Conditional Breakpoint" })

vim.keymap.set("n", "<F7>", function()
  local dapui = get_dapui()
  if dapui then dapui.toggle() end
end, { desc = "DAP UI Toggle" })
