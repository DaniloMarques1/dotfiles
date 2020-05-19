call plug#begin('~/.vim/plugged')
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'https://github.com/MaxMEllon/vim-jsx-pretty.git'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

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
nnoremap <C-b> :buffers<cr>

" coc vim commands
set hidden
set shortmess+=c
" show  warnings for nonused vars, error, etc
set signcolumn=yes "eu prefiro quando afasta o texto para mostrar o erro
" makes tab navigates through autocomplete options
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

"inoremap <silent><expr> <c> coc#refresh()
"inoremap <c-c> coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" go to definition
nmap <silent> gd <Plug>(coc-definition)

" show documentation
nnoremap <silent> K :call <SID>show_documentation()<CR> 
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
