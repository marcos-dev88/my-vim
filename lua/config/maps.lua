
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Líder
vim.g.mapleader = ","

-- Sair com Ctrl+Q
keymap.set('n', '<C-q>', ':q<CR>', opts)

-- Tab para indentação no modo normal
keymap.set('n', '<Tab>', '>>_', opts)
keymap.set('n', '<S-Tab>', '<<_', opts)

-- Tab para indentação no modo visual
keymap.set('v', '<Tab>', '>gv', opts)
keymap.set('v', '<S-Tab>', '<gv', opts)

-- Remover highlight de busca
keymap.set('n', '<A-q>', ':nohls<CR>', opts)

-- Navegação entre tabs
keymap.set('n', '<A-,>', 'gT', opts)
keymap.set('n', '<A-.>', 'gt', opts)
keymap.set('n', '<A-c>', ':tabclose<CR>', opts)

-- Salvar com Ctrl+S
keymap.set('n', '<C-s>', ':w<CR>', opts)
keymap.set('i', '<C-s>', '<ESC>:w<CR>l', {})
keymap.set('v', '<C-s>', '<ESC>:w<CR>', {})

-- Selecionar tudo com Ctrl+A
keymap.set('n', '<C-a>', 'ggVG', opts)

-- Multi-select: procura por seleção atual
keymap.set('v', '//', function()
    -- Copia seleção e inicia busca com ela escapada
    vim.cmd([[normal! y]])
    local escaped = vim.fn.escape(vim.fn.getreg('"'), '\\/.*$^~[]')
    vim.fn.setreg('/', escaped)
    vim.cmd('normal! n')
end, { desc = "Search by select", noremap = true, silent = true })


-- Auto-complete de pares
keymap.set('i', '"', '""<Left>', {})
keymap.set('i', "'", "''<Left>", {})
keymap.set('i', '`', '``<Left>', {})
keymap.set('i', '(', '()<Left>', {})
keymap.set('i', '[', '[]<Left>', {})
keymap.set('i', '{', '{}<Left>', {})
keymap.set('i', '{<CR>', '{<CR>}<ESC>0', {})
keymap.set('i', '{;<CR>', '{<CR>};<ESC>0', {})
keymap.set('i', '<', '<><Left>', {})

-- Code folding (toggle com espaço)
keymap.set('n', '<space>', 'za', opts)

-- Copiar caminho real do arquivo atual
keymap.set('n', '<leader>p', ':r!realpath %<CR>dd<CR>', opts)

-- Redimensionar splits
keymap.set('n', '<A-h>', ':vertical resize -3<CR>', opts)
keymap.set('n', '<A-l>', ':vertical resize +3<CR>', opts)
keymap.set('n', '<A-j>', ':resize +3<CR>', opts)
keymap.set('n', '<A-k>', ':resize -3<CR>', opts)

-- Mover entre splits
keymap.set('n', '<C-h>', '<C-w>h', opts)
keymap.set('n', '<C-l>', '<C-w>l', opts)
keymap.set('n', '<C-j>', '<C-w>j', opts)
keymap.set('n', '<C-k>', '<C-w>k', opts)

