syntax off

colorscheme green

set guicursor=
"set guicursor=n-v-ve-c-ci:block-iCursor,i:ver30-iCursor

let mapleader = " "

set autoindent
set autoread
"set number
set backspace=indent,eol,start
filetype indent on
filetype plugin on

set tabstop=4
set shiftwidth=4
set expandtab

set smartindent
set nobackup
set nowritebackup
set noswapfile
set ls=0
set autochdir
set hlsearch

map <C-s> :w<cr>
nnoremap <C-l> :noh<cr>
nnoremap <leader>q :bd!<cr>

nnoremap <C-Left> :tabprev<cr>
nnoremap <C-Right> :tabnext<cr>

autocmd FileType go setlocal shiftwidth=8 tabstop=8 noexpandtab
autocmd FileType markdown setlocal tw=80
