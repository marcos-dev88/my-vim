local keymap = vim.api.nvim_set_keymap
local noremap_opts = { noremap = true }
local cmd = vim.cmd
keymap('n', 'q', ':q<CR>', noremap_opts)
-- tab config keymap
cmd([[
	nnoremap <Tab> >>_
	nnoremap <S-Tab> <<_
	vmap <S-Tab>  mm<`m:<C-U>exec "normal ".&shiftwidth."h"<CR>mmgv`m
	vmap <Tab>    mm>`m:<C-U>exec "normal ".&shiftwidth."l"<CR>mmgv`m
]])
-- search removing search setting
keymap('n', '<A-k>', ':nohls<CR>', noremap_opts)

-- tab config
keymap('n', '<A-,>', 'gT', noremap_opts)
keymap('n', '<A-.>', 'gt', noremap_opts)
keymap('n', '<A-c>', ':tabclose<CR>', noremap_opts)

-- save config
keymap('n', '<C-s>', ':w<CR>', noremap_opts)
keymap('i', '<C-s>', '<ESC>:w<CR>l', {}) 
keymap('v', '<C-s>', '<ESC>:w<CR>', {}) 

-- select all
keymap('n', '<C-a>', 'ggVG', noremap_opts)

-- auto-complete dev sections
cmd([[
    inoremap " ""<left>
    inoremap ' ''<left>
    inoremap ` ``<left>
]])

keymap('i', '(', '()<left>', {})
keymap('i', '[', '[]<left>', {})
keymap('i', '{', '{}<left>', {})
keymap('i', '{<CR>', '{<CR>}<ESC>0', {})
keymap('i', '{;<CR>', '{<CR>};<ESC>0', {})
keymap('i', '<', '<><left>', {})
