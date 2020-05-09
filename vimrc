call plug#begin('~/.vim/plugged')
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'https://github.com/MaxMEllon/vim-jsx-pretty.git'
  Plug 'sheerun/vim-polyglot' "improve syntax highlight
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'https://github.com/joshdick/onedark.vim.git'
call plug#end()

let mapleader = " "
set background=dark
colorscheme dark
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
noremap <leader>h :bnext<cr>
noremap <leader>l :bprev<cr>
noremap <leader>t :terminal<cr>
noremap <leader>e :Explore<cr>

let g:monokai_term_italic = 1
let g:monokai_gui_italic = 1

" coc vim commands

set hidden
set shortmess+=c
" show  warnings for nonused vars, error, etc
"set signcolumn=yes "eu prefiro quando afasta o texto para mostrar o erro
" makes tab navigates through autocomplete options
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
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
