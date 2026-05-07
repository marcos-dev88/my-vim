local go_bin = os.getenv("GOBIN") or (os.getenv("HOME") .. "/go/bin")
local ok, dap = pcall(require, 'dap')
if not ok then return end

local okd, dapui = pcall(require, 'dapui')
if not okd then return end

-- 1. Mason DAP Setup
require('mason-nvim-dap').setup {
    automatic_setup = true,
    handlers = {},
    ensure_installed = {
        'delve',           -- Go
        'debugpy',         -- Python
        'cpptools',        -- C/C++/Rust
        'js-debug-adapter' -- JS/TS
    },
}

-- C / C++ / Rust
local cpp_conf = {
    {
        name = "Launch file",
        type = "cpptools",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopAtEntry = true,
    },
}
dap.configurations.cpp = cpp_conf
dap.configurations.c = cpp_conf
dap.configurations.rust = cpp_conf

-- JavaScript / TypeScript
for _, language in ipairs({ "typescript", "javascript", "typescriptreact", "javascriptreact" }) do
    dap.configurations[language] = {
        {
            type = "pwa-node",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            cwd = "${workspaceFolder}",
        },
    }
end

-- 3. Keymaps de Debugging
vim.keymap.set('n', '<F5>', dap.continue, { desc = 'Debug: Start/Continue' })
vim.keymap.set('n', '<F1>', dap.step_into, { desc = 'Debug: Step Into' })
vim.keymap.set('n', '<F2>', dap.step_over, { desc = 'Debug: Step Over' })
vim.keymap.set('n', '<F3>', dap.step_out, { desc = 'Debug: Step Out' })
vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
vim.keymap.set('n', '<leader>B', function()
    dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
end, { desc = 'Debug: Set Breakpoint' })
vim.keymap.set('n', '<F7>', dapui.toggle, { desc = 'Debug: See last session result.' })

-- 4. DAP UI Setup
dapui.setup {
    icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
    controls = {
        icons = {
            pause = '⏸',
            play = '▶',
            step_into = '⏎',
            step_over = '⏭',
            step_out = '⏮',
            step_back = 'b',
            run_last = '▶▶',
            terminate = '⏹',
            disconnect = '⏏',
        },
    },
}

-- Autoclose/Open UI
dap.listeners.after.event_initialized['dapui_config'] = dapui.open
dap.listeners.before.event_terminated['dapui_config'] = dapui.close
dap.listeners.before.event_exited['dapui_config'] = dapui.close

-- 5. Breakpoints style
vim.api.nvim_set_hl(0, "red_breakpoint", {ctermbg = 0, fg = "#F93D3D"})
vim.api.nvim_set_hl(0, "green_breakpoint", {ctermbg = 0, fg = "#36d93e"})

vim.fn.sign_define("DapBreakpoint", {texthl = "red_breakpoint", text= "⚫", linehl = "DapBreakpoint", numhl = "DapBreakpoint"})
vim.fn.sign_define("DapBreakpointCondition", {texthl = "green_breakpoint", text= "⚫", linehl = "DapBreakpoint", numhl = "DapBreakpoint"})
vim.fn.sign_define("DapStopped", {texthl = "green_breakpoint", text= "⚫", linehl = "DapBreakpoint", numhl = "DapBreakpoint"})

-- 6. Go Config
local ok_dap_go, dap_go = pcall(require, 'dap-go')
if ok_dap_go then
    dap_go.setup({
        delve = {
            path = go_bin .. "/dlv",
            initialize_timeout_sec = 20,
        },
    })
end
