local keymap = vim.api.nvim_set_keymap
local noremap_opts = { noremap = true }
local cmd = vim.cmd
keymap('n', '<C-q>', ':q<CR>', noremap_opts)
-- tab config keymap
cmd([[
    nnoremap <Tab> >>_
	nnoremap <S-Tab> <<_
    vmap <tab> >gv
    vmap <S-Tab> <gv
]])

-- vmap <S-Tab>  mm<`m:<C-U>exec "normal ".&shiftwidth."h"<CR>mmgv`m
-- vmap <Tab>    mm>`m:<C-U>exec "normal ".&shiftwidth."l"<CR>mmgv`m
-- keymap('v', '<Tab>', '>',{})
-- keymap('v', '<S-Tab>', '<',{})

-- search removing search setting
keymap('n', '<A-q>', ':nohls<CR>', noremap_opts)

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

-- multiselect
cmd([[
    vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
]])

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

-- code folding mapping:
keymap('n', '<space>', 'za', noremap_opts)

-- copy to clipboard the realpath
keymap('n', '<leader>p', ':r!realpath %<CR>dd<CR>', noremap_opts)

-- resize windows: 
keymap('n', '<A-h>', ':vertical resize -3<CR>', noremap_opts)
keymap('n', '<A-l>', ':vertical resize +3<CR>', noremap_opts) 
keymap('n', '<A-j>', ':resize +3<CR>', noremap_opts) 
keymap('n', '<A-k>', ':resize -3<CR>', noremap_opts)

-- change windows
keymap('n', '<C-h>', '<C-w>h', noremap_opts)
keymap('n', '<C-l>', '<C-w>l', noremap_opts) 
keymap('n', '<C-j>', '<C-w>j', noremap_opts) 
keymap('n', '<C-k>', '<C-w>k', noremap_opts)
