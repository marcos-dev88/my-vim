if exists(':GuiFont')
	GuiFont! JetBrains Mono:h12 
endif

set number
" set relativenumber
set autoindent
set tabstop=4
set shiftwidth=4
set smarttab 
set softtabstop=4
set updatetime=100
set listchars+=trail:-
set scrolloff=10
set cmdheight=2
set encoding=utf-8
set nobackup
set nowritebackup
set autoread
filetype on
filetype plugin on
filetype indent on
set sessionoptions+=globals

" for transparent bg
let g:transparent_enabled="true"

" making python3 use phython only, if your python is already 'python3' you can
" comment this part:
let g:python3_host_prog = '/usr/bin/python'

call plug#begin()
" nvim Plug
Plug 'vim-airline/vim-airline' " https://github.com/vim-airline/vim-airline
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree' " https://github.com/preservim/nerdtree
Plug 'tpope/vim-commentary' " https://github.com/tpope/vim-commentary
Plug 'ryanoasis/vim-devicons' " https://github.com/ryanoasis/vim-devicons + https://github.com/ryanoasis/nerd-fonts/
Plug 'mkitt/tabline.vim' " https://github.com/mkitt/tabline.vim
Plug 'rafi/awesome-vim-colorschemes' " https://github.com/rafi/awesome-vim-colorschemes 
Plug 'tribela/vim-transparent'
Plug 'LunarVim/Colorschemes'
Plug 'kien/ctrlp.vim'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Go plug
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'SirVer/ultisnips' " https://github.com/sirver/UtiSnips

" Git config
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

call plug#end()

:colorscheme onehalfdark 

" Use <c-space> to autocomplete suggestion
if has('nvim')
	inoremap <silent><expr> <c-space> coc#refresh()
else
	inoremap <silent><expr> <c-@> coc#refresh()
endif
" Airline config
let g:airline_theme='owo'
let g:airline#extension#tabline#enabled = 1 
let g:airline_powerline_fonts = 1 

" map split nav
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"Nerd tree config
nnoremap <S-r> :NERDTreeRefreshRoot<CR>
nnoremap <S-n><S-f> :NERDTreeFocus<CR>
nnoremap <S-n><S-t> :NERDTreeToggle<CR>
nnoremap <S-n><S-c> :NERDTreeClose<CR>
nnoremap <S-n> :NERDTree<CR>
" open NERDTree
autocmd VimEnter * NERDTree

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

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="-"

" config icons collors
let s:goColor ="8EE3E4"
let s:shellColor ="1be85c"

let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['go'] = s:goColor
let g:NERDTreeExtensionHighlightColor['sh'] = s:shellColor

" config tabs

" move previous
map <A-,> gt
" move next
map <A-.> gT

:map <A-c> :tabclose<CR>
