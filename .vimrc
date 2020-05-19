let mapleader = " "

colorscheme green
set clipboard=unnamedplus "use system clipboard by default

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
noremap <leader>h :bnext<cr>
noremap <leader>l :bprev<cr>
noremap <leader>t :terminal<cr>
noremap <leader>j 5j<cr>
noremap <leader>k 5k<cr>
"open the file in a new buffer
noremap <leader>fe :Explore<cr>
"open the file in the current buffer
noremap <leader>e :bd\| :Explore<cr>

nnoremap <C-p> :edit 
nnoremap <C-b> :b <C-d>
