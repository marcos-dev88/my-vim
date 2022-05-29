:set number
:set relativenumber
:set autoindent
:set tabstop=3
:set shiftwidth=3 
:set smarttab 
:set softtabstop=3
:set mouse=a

" making python3 use phython only, if your python is already 'python3' you can
" comment this part:
let g:python3_host_prog = '/usr/bin/python'

call plug#begin()
" nvim Plug
Plug 'vim-airline/vim-airline' " https://github.com/vim-airline/vim-airline
Plug 'preservim/nerdtree' " https://github.com/preservim/nerdtree
Plug 'tpope/vim-commentary' " https://github.com/tpope/vim-commentary
Plug 'ryanoasis/vim-devicons' " https://github.com/ryanoasis/vim-devicons + https://github.com/ryanoasis/nerd-fonts/
Plug 'mkitt/tabline.vim' " https://github.com/mkitt/tabline.vim
Plug 'rafi/awesome-vim-colorschemes' " https://github.com/rafi/awesome-vim-colorschemes 

" Go plug
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'SirVer/ultisnips' " https://github.com/sirver/UtiSnips

call plug#end()

:colorscheme PaperColor

nnoremap <S-n><S-f> :NERDTreeFocus<CR>
nnoremap <S-n><S-t> :NERDTreeToggle<CR>
nnoremap <S-n><S-c> :NERDTreeClose<CR>
nnoremap <S-n> :NERDTree<CR>



let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="-"
