call plug#begin('~/.vim/plugged')
  Plug 'vimwiki/vimwiki'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
call plug#end()

let mapleader = " "

syntax on
colorscheme colorscheme

set guicursor=
set incsearch
set expandtab
set nobackup
set nowritebackup
set noswapfile
set updatetime=50
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set shortmess+=c

noremap :W :w
noremap :Q :q
noremap <leader>q :bd<cr>
noremap <leader>ex :Explore<cr>
noremap <C-l> :noh<cr>

noremap <leader>ss :set syn=

" FZF stuff
noremap <Leader>p    :GFiles<CR>
noremap <Leader>f    :Files<CR>
noremap <Leader>b    :Buffers<CR>
noremap <Leader>st   :GFiles?<CR>

nnoremap <silent> <Leader>= :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "vertical resize " . (winwidth(0) * 2/3)<CR>

noremap <silent> <C-Right> :tabnext<cr>
noremap <silent> <C-Left> :tabprev<cr>

" go stuff
autocmd FileType go,c,cpp setlocal shiftwidth=8 tabstop=8 noexpandtab
autocmd FileType java setlocal shiftwidth=4 tabstop=4
autocmd FileType markdown setlocal textwidth=100

"" vimwiki
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

