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
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'

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

" Bar config
let bufferline = get(g:, 'bufferline', {})

" New tabs are opened next to the currently selected tab.
" Enable to insert them in buffer number order.
let bufferline.add_in_buffer_number_order = v:false

" Enable/disable animations
let bufferline.animation = v:true

" Enable/disable auto-hiding the tab bar when there is a single buffer
let bufferline.auto_hide = v:true

" Enable/disable current/total tabpages indicator (top right corner)
let bufferline.tabpages = v:true

" Enable/disable close button
let bufferline.closable = v:true

" Enables/disable clickable tabs
"  - left-click: go to buffer
"  - middle-click: delete buffer
let bufferline.clickable = v:true

" Excludes buffers from the tabline
let bufferline.exclude_ft = ['javascript']
let bufferline.exclude_name = ['package.json']

" Enable/disable icons
" if set to 'buffer_number', will show buffer number in the tabline
" if set to 'numbers', will show buffer index in the tabline
" if set to 'both', will show buffer index and icons in the tabline
" if set to 'buffer_number_with_icon', will show buffer number and icons in the tabline
let bufferline.icons = v:true

" Sets the icon's highlight group.
" If false, will use nvim-web-devicons colors
let bufferline.icon_custom_colors = v:true

" Configure icons on the bufferline.
let bufferline.icon_separator_active = '▎'
let bufferline.icon_separator_inactive = '▎'
let bufferline.icon_close_tab = ''
let bufferline.icon_close_tab_modified = '●'
let bufferline.icon_pinned = 'P'

" If true, new buffers will be inserted at the start/end of the list.
" Default is to insert after current buffer.
let bufferline.insert_at_start = v:false
let bufferline.insert_at_end = v:false

" Sets the maximum padding width with which to surround each tab.
let bufferline.maximum_padding = 4

" Sets the maximum buffer name length.
let bufferline.maximum_length = 30

" If set, the letters for each buffer in buffer-pick mode will be
" assigned based on their name. Otherwise or in case all letters are
" already assigned, the behavior is to assign letters in order of
" usability (see order below)
let bufferline.semantic_letters = v:true

" New buffer letters are assigned in this order. This order is
" optimal for the qwerty keyboard layout but might need adjustement
" for other layouts.
let bufferline.letters =
  \ 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP'

" Sets the name of unnamed buffers. By default format is "[Buffer X]"
" where X is the buffer number. But only a static string is accepted here.
let bufferline.no_name_title = v:null

" Move to previous/next
nnoremap <silent>    <A-,> :BufferPrevious<CR>
nnoremap <silent>    <A-.> :BufferNext<CR>
" Re-order to previous/next
nnoremap <silent>    <S-H> :BufferMovePrevious<CR>
nnoremap <silent>    <S-L> :BufferMoveNext<CR>
" Goto buffer in position...
nnoremap <silent>    <A-1> :BufferGoto 1<CR>
nnoremap <silent>    <A-2> :BufferGoto 2<CR>
nnoremap <silent>    <A-3> :BufferGoto 3<CR>
nnoremap <silent>    <A-4> :BufferGoto 4<CR>
nnoremap <silent>    <A-5> :BufferGoto 5<CR>
nnoremap <silent>    <A-6> :BufferGoto 6<CR>
nnoremap <silent>    <A-7> :BufferGoto 7<CR>
nnoremap <silent>    <A-8> :BufferGoto 8<CR>
nnoremap <silent>    <A-9> :BufferGoto 9<CR>
nnoremap <silent>    <A-0> :BufferLast<CR>
" Pin/unpin buffer
nnoremap <silent>    <A-p> :BufferPin<CR>
" Close buffer
nnoremap <silent>    <A-c> :BufferClose<CR>
" Wipeout buffer
"                          :BufferWipeout<CR>
" Close commands
"                          :BufferCloseAllButCurrent<CR>
"                          :BufferCloseAllButPinned<CR>
"                          :BufferCloseAllButCurrentOrPinned<CR>
"                          :BufferCloseBuffersLeft<CR>
"                          :BufferCloseBuffersRight<CR>
" Magic buffer-picking mode
nnoremap <silent> <C-p>    :BufferPick<CR>
" Sort automatically by...
nnoremap <silent> <Space>bb :BufferOrderByBufferNumber<CR>
nnoremap <silent> <Space>bd :BufferOrderByDirectory<CR>
nnoremap <silent> <Space>bl :BufferOrderByLanguage<CR>
nnoremap <silent> <Space>bw :BufferOrderByWindowNumber<CR>
