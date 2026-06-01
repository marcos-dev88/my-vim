local fn = vim.fn
local cmd = vim.cmd
local g = vim.g

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
local packer_bootstrap = nil

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  cmd('packadd packer.nvim')
end

-- Força o Packer a recompilar o cache automaticamente sempre que você salvar este arquivo
cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugin-pack.lua source <afile> | PackerCompile
  augroup END
]])

vim.g.rustfmt_autosave = 1

return require('packer').startup(function(use)
    use "vim-airline/vim-airline"
    use {
      "vim-airline/vim-airline-themes",

      after = "vim-airline",

      config = function()
        require("plugins.vim-airline-themes")
      end,
    }

    use 'ryanoasis/vim-devicons'
    use 'tribela/vim-transparent'

    use {
      "nvim-telescope/telescope.nvim",

      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-live-grep-args.nvim",
      },

      config = function()
        require("plugins.telescope")
      end,
    }

    use {
      "tpope/vim-commentary",

      config = function()
        require("plugins.vim-commentary")
      end,
    }

    use 'mkitt/tabline.vim'
    use 'Xuyuanp/nerdtree-git-plugin'
    use 'ludovicchabant/vim-gutentags'

    --use {
     --   'fatih/vim-go', 
      --  run = ':GoUpdateBinaries'
    --}

    use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",

      config = function()
        require("plugins.nvim-treesitter")
      end,
    }
        
    --use 'SirVer/ultisnips'
    use {
      "lewis6991/gitsigns.nvim",

      config = function()
        require("plugins.gitsigns")
      end,
    }

    use {
      "akinsho/git-conflict.nvim",

      config = function()
        require("plugins.git-conflict")
      end,
    }

    use 'nvim-tree/nvim-web-devicons'

    use {
      "glepnir/dashboard-nvim",

      requires = {
        "nvim-tree/nvim-web-devicons",
      },

      config = function()
        require("plugins.dashboard-nvim")
      end,
    }

    use 'navarasu/onedark.nvim'
    use { 'catppuccin/nvim', as = 'catppuccin' }
    use 'rebelot/kanagawa.nvim'
    use {
        'ViViDboarder/wombat.nvim',
        requires = { 'rktjmp/lush.nvim' }
    }

    use {
      "nvim-tree/nvim-tree.lua",

      requires = {
        "nvim-tree/nvim-web-devicons",
      },

      config = function()
        require("plugins.nvim-tree")
      end,
    }
     
    --use { "TabbyML/vim-tabby", config = function() vim.g.tabby_server_url = "http://localhost:5262" end }
    use "neovim/nvim-lspconfig"
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'saadparwaiz1/cmp_luasnip'
    use 'L3MON4D3/LuaSnip'
    use 'rafamadriz/friendly-snippets'
    use 'ray-x/lsp_signature.nvim'
    -- use { 'tzachar/cmp-tabnine', run = './install.sh', requires = 'hrsh7th/nvim-cmp' }
    use 'onsails/lspkind-nvim'
    use 'VidocqH/lsp-lens.nvim'
    use 'simrat39/rust-tools.nvim'
    use 'rust-lang/rust.vim'
    use 'mfussenegger/nvim-jdtls'

    use {
      "mfussenegger/nvim-dap",

      requires = {
        "rcarriga/nvim-dap-ui",
        "williamboman/mason.nvim",
        "jay-babu/mason-nvim-dap.nvim",
        "leoluz/nvim-dap-go",
      },

      config = function()
        require("plugins.dap")
      end,
    }

    if packer_bootstrap then
        vim.cmd("autocmd User PackerComplete ++once lua print('Packer ready')")
        require('packer').sync()
        return
    end
end)

