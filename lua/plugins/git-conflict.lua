local ok, gc = pcall(require, "git-conflict")
if not ok then
    return
end

local keymap = vim.api.nvim_set_keymap
local noremap_opts = { noremap = true }
local cmd = vim.cmd

cmd([[
    highlight conflictIncoming ctermbg=red ctermfg=black
    highlight conflictCurrent ctermbg=blue ctermfg=black
]])

gc.setup{ 
    default_mappings = false,
    disable_diagnostics = false,
    highlights = { 
        incoming = 'conflictIncoming',
        current = 'conflictCurrent',
    }
}

vim.api.nvim_create_autocmd('User', { 
    pattern = 'GitConflictDetected',
    callback = function()
        vim.notify('Conflict detected in'..vim.fn.expand('<afile>'))
        vim.keymap.set('n', 'cww', function()
            engage.conflict_buster()
            create_buffer_local_mappings()
        end)
    end
})

keymap('n', 'co', '<cmd>GitConflictChooseOurs<CR>', noremap_opts)
keymap('n', 'ct', '<cmd>GitConflictChooseTheirs<CR>', noremap_opts)
keymap('n', 'cb', '<cmd>GitConflictChooseBoth<CR>', noremap_opts)
keymap('n', 'c0', '<cmd>GitConflictChooseNone<CR>', noremap_opts)
keymap('n', ']x', '<cmd>GitConflictNextConflict<CR>', noremap_opts)
keymap('n', '[x', '<cmd>GitConflictPrevConflict<CR>', noremap_opts)
