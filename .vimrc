call plug#begin('~/.vim/plugged')
  Plug 'git@github.com:sheerun/vim-polyglot.git'
  Plug 'git@github.com:tomasiser/vim-code-dark.git'
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
call plug#end()

let mapleader = " "

syntax on
colorscheme gotham256

set number
set incsearch
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set nobackup
set nowritebackup
set smartindent
set noswapfile

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

noremap <C-h> <C-w>h
noremap <C-l> <C-w>l

"nnoremap <C-p> :edit 
"nnoremap <C-b> :b <C-d>

noremap <C-p> :GFiles<cr>
noremap <leader>p :Files<cr>
noremap <leader>b :Buffers<cr>

