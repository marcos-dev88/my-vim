local keymap = vim.api.nvim_set_keymap
local noremap_opts = { noremap = true }

-- tab config keymap
keymap('n', '<TAB>', '>>_', noremap_opts)
keymap('n', '<TAB>', '<<_', noremap_opts)
keymap('v', '<S-tab>', 'mm<`m:<c-u>exec "normal ".&shiftwidth."h"<cr>mmgv`m', {})
keymap('v', '<TAB>', 'mm>`m:<C-U>exec "normal ".&shiftwidth."l"<CR>mmgv`m', {})

-- search removing search setting
keymap('n', '<A-k>', ':nohls<CR>', noremap_opts)

-- tab config
keymap('n', '<A-,>', 'gT', noremap_opts)
keymap('n', '<A-.>', 'gt', noremap_opts)
keymap('n', '<A-c>', ':tabclose<CR>', noremap_opts)
