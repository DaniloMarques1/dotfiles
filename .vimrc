call plug#begin('~/.vim/plugged')
  Plug 'vimwiki/vimwiki'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
call plug#end()

let mapleader = " "

syntax on
colorscheme colorscheme

"set nu
set guicursor=
"set guicursor=n-v-c:block,i-ci:ver25,a:blinkon250-Cursor
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
noremap <C-l> :noh<cr>

noremap <leader>ss :set syn=

" FZF stuff
noremap <Leader>p    :GFiles<CR>
noremap <Leader>f    :Files<CR>
noremap <Leader>b    :Buffers<CR>
noremap <Leader>st   :GFiles?<CR>

noremap <silent> <C-Right> :tabnext<cr>
noremap <silent> <C-Left> :tabprev<cr>

" go stuff
autocmd FileType go setlocal shiftwidth=8 tabstop=8 noexpandtab

autocmd FileType java,c,cpp setlocal shiftwidth=4 tabstop=4
autocmd FileType markdown setlocal textwidth=100 signcolumn=no

"" vimwiki
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_global_ext = 0

nnoremap <silent> <Leader>= :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
set laststatus=0
