local fn = vim.fn
local cmd = vim.cmd
local g = vim.g

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  cmd([[
        packadd packer.nvim
    ]])
end

return require('packer').startup(function()
    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'
    use 'ryanoasis/vim-devicons' -- https://github.com/ryanoasis/vim-devicons + https://github.com/ryanoasis/nerd-fonts/
    -- use 'rafi/awesome-vim-colorschemes' -- https://github.com/rafi/awesome-vim-colorschemes 
    -- use 'LunarVim/Colorschemes'
    -- use 'JoosepAlviste/palenightfall.nvim'
    use 'tribela/vim-transparent' 
    use {
        'nvim-telescope/telescope.nvim',
        requires = { 
            { 'nvim-lua/plenary.nvim' },
            { 'nvim-telescope/telescope-live-grep-args.nvim' },
        },
        config = function()
            require('telescope').load_extension('live_grep_args')
        end
    }
    use 'tpope/vim-commentary' -- https://github.com/tpope/vim-commentary
    use 'mkitt/tabline.vim' -- https://github.com/mkitt/tabline.vim
    use 'Xuyuanp/nerdtree-git-plugin'
    use 'ludovicchabant/vim-gutentags'
    -- use 'vimcolorschemes/vimcolorschemes'
    -- Go config
    use {
        'fatih/vim-go', 
        run = ':GoUpdateBinaries'
    } 

    -- Treesitter config
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    use 'nvim-treesitter/nvim-treesitter-refactor'
    use 'nvim-treesitter/playground'

    use 'SirVer/ultisnips' -- https://github.com/sirver/UtiSnips

    -- Git config
    use {
        'lewis6991/gitsigns.nvim',
    }

    use { 
        'akinsho/git-conflict.nvim'
    }

    use 'nvim-tree/nvim-web-devicons'

    use {  
        'glepnir/dashboard-nvim',
        requires = {{ 'nvim-tree/nvim-web-devicons' }},
    }

    -- install colorscheme
    use 'navarasu/onedark.nvim'
    use { "catppuccin/nvim", as = "catppuccin" }
    use 'rebelot/kanagawa.nvim'

    use {
        'ViViDboarder/wombat.nvim',
        requires = {{ 'rktjmp/lush.nvim' }}
    }

    use { 
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
    }

    -- LSP config
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'saadparwaiz1/cmp_luasnip'
    use 'L3MON4D3/LuaSnip'
    use 'rafamadriz/friendly-snippets'
    use 'ray-x/lsp_signature.nvim'
    use {
        'tzachar/cmp-tabnine', 
        run='./install.sh', 
        requires = 'hrsh7th/nvim-cmp'
    }

    use 'onsails/lspkind-nvim'
    use 'VidocqH/lsp-lens.nvim'

    -- rust config
    use 'simrat39/rust-tools.nvim'
    use {
        'rust-lang/rust.vim',
        cmd([[ 
        let g:rustfmt_autosave = 1
        ]])
    }

    -- use 'ollykel/v-vim'

    use 'mfussenegger/nvim-jdtls'

    use {
        'mfussenegger/nvim-dap',
        requires = {
            {'rcarriga/nvim-dap-ui'},
            {'williamboman/mason.nvim'},
            {'jay-babu/mason-nvim-dap.nvim'},
            {'leoluz/nvim-dap-go'},
        },
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
