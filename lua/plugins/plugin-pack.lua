local fn = vim.fn
local cmd = vim.cmd
local g = vim.g
local keymap = vim.api.nvim_set_keymap
local noremap_opts = { noremap = true }

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup(function()
    use 'vim-airline/vim-airline'
    use {
      'vim-airline/vim-airline-themes',
      cmd([[
        let g:airline_theme='owo'
        let g:airline#extension#tabline#enabled = 1
        let g:airline_powerline_fonts = 1
      ]])
    }
    use 'ryanoasis/vim-devicons' -- https://github.com/ryanoasis/vim-devicons + https://github.com/ryanoasis/nerd-fonts/
    use 'rafi/awesome-vim-colorschemes' -- https://github.com/rafi/awesome-vim-colorschemes 
    use 'LunarVim/Colorschemes'
    use 'JoosepAlviste/palenightfall.nvim'
    use 'tribela/vim-transparent'
    use {
        'ctrlpvim/ctrlp.vim',
        cmd([[
            let g:ctrlp_map = '<c-p>'
            let g:ctrlp_cmd = 'CtrlP :pwd'
            let g:ctrlp_working_path_mode = 'ra'
            let g:ctrlp_switch_buffer = 'et'
            let g:ctrlp_show_hidden = 1
        ]])
    }
    use {
      'preservim/nerdtree', -- https://github.com/preservim/nerdtree
      keymap('n', '<S-r>', ':NERDTreeRefreshRoot<CR>', noremap_opts),
      keymap('n', '<S-n><S-f>', ':NERDTreeFocus<CR>', noremap_opts),
      keymap('n', '<S-n><S-t>', ':NERDTreeToggle<CR>', noremap_opts),
      keymap('n', '<S-n><S-c>', ':NERDTreeClose<CR>', noremap_opts),
      keymap('n', '<S-t>', ':NERDTree<CR>', noremap_opts),
      keymap('n', '<C-h>', '<C-w>h', noremap_opts),
      keymap('n', '<C-j>', '<C-w>j', noremap_opts),
      keymap('n', '<C-k>', '<C-w>k', noremap_opts),
      keymap('n', '<C-l>', '<C-w>l', noremap_opts),
      cmd([[
        let g:NERDTreeGitStatusIndicatorMapCustom = {
          \ 'Modified'  :'➜',
          \ 'Staged'    :'✚',
          \ 'Untracked' :'~',
          \ 'Renamed'   :'R',
          \ 'Unmerged'  :'═',
          \ 'Deleted'   :'✖',
          \ 'Dirty'     :'*',
          \ 'Ignored'   :'☒',
          \ 'Clean'     :'✔︎',
          \ 'Unknown'   :'?',
          \ }

        let g:NERDTreeDirArrowExpandable="▶"
        let g:NERDTreeDirArrowCollapsible="▼"

        " config icons collors
        let s:goColor ="8EE3E4"
        let s:shellColor ="1be85c"
        let s:luaColor ="d9b3ff"

        let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
        let g:NERDTreeExtensionHighlightColor['go'] = s:goColor
        let g:NERDTreeExtensionHighlightColor['sh'] = s:shellColor
        let g:NERDTreeExtensionHighlightColor['lua'] = s:luaColor
      ]]),
    }
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use 'tpope/vim-commentary' -- https://github.com/tpope/vim-commentary
    use 'mkitt/tabline.vim' -- https://github.com/mkitt/tabline.vim
    use 'kien/ctrlp.vim'
    use 'tiagofumo/vim-nerdtree-syntax-highlight'
    use 'Xuyuanp/nerdtree-git-plugin'
    use 'ludovicchabant/vim-gutentags'
    use 'vimcolorschemes/vimcolorschemes'
    -- Go plug
    use {
      'fatih/vim-go', 
      run = ':GoUpdateBinaries'
    }

    use {
      'neoclide/coc.nvim', 
      branch = 'release',

      cmd([[
        if has('nvim')
            inoremap <silent><expr> <c-space> coc#refresh()
        else
            inoremap <silent><expr> <c-@> coc#refresh()
        endif
      ]])
    }

    use 'SirVer/ultisnips' -- https://github.com/sirver/UtiSnips

    -- Git config
    use 'mhinz/vim-signify'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-rhubarb'
  
    -- Def colorscheme
    require('palenightfall').setup()
    
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
    if packer_bootstrap then
      require('packer').sync()
    end
end)



