call plug#begin('~/.vim/plugged')
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'sheerun/vim-polyglot'
call plug#end()

let mapleader = " "

syntax on
colorscheme colorscheme

set number
set incsearch
set shiftwidth=4
set tabstop=4
set softtabstop=0
set expandtab
set nobackup
set nowritebackup
set smartindent
set noswapfile
set updatetime=100

noremap :W :w
noremap :Q :q
noremap <leader>h :bnext<cr>
noremap <leader>l :bprev<cr>
noremap <leader>t :terminal<cr>
noremap <leader>sh :shell<cr>
noremap <leader>j 5j<cr>
noremap <leader>k 5k<cr>
noremap <leader>q :bd<cr>
noremap <leader>fe :Explore<cr>
noremap <leader>e :bd\| :Explore<cr>
noremap <C-l> :noh<cr>

"nnoremap <C-p> :edit 
"nnoremap <C-b> :b <C-d>

noremap <C-p> :GFiles<cr>
noremap <leader>p :Files<cr>
noremap <leader>b :Buffers<cr>
noremap <leader>ss :set syn=
