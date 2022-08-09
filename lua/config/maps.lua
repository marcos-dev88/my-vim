local keymap = vim.api.nvim_set_keymap
local noremap_opts = { noremap = true }
local cmd = vim.cmd
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