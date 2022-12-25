local keymap = vim.api.nvim_set_keymap
local noremap_opts = { noremap = true }

-- comment line
keymap('n', '<A-/>', ':Commentary<CR>', noremap_opts)
keymap('i', '<A-/>', '<ESC>:Commentary<CR>l', {})
keymap('v', '<A-/>', ':Commentary<CR>', {})

