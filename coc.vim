set hidden
set shortmess+=c
set updatetime=300
" show  warnings for nonused vars, error, etc
set signcolumn=yes "eu prefiro quando afasta o texto para mostrar o erro
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

" trigger completition whe npress C-f
inoremap <silent><expr> <C-f> coc#refresh()

" show documentation
"nnoremap <silent> M :call <SID>show_documentation()<CR> 
"function! s:show_documentation()
"  if (index(['vim','help'], &filetype) >= 0)
"    execute 'h '.expand('<cword>')
"  else
"    call CocAction('doHover')
"  endif
"endfunction

" go to definition
nmap <silent> gd <Plug>(coc-definition)
" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
"
" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)<CR>
nmap <leader>f  <Plug>(coc-format-selected)<CR>
