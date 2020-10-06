"" LSP CONFIG

lua require'nvim_lsp'.clangd.setup{on_attach=require'completion'.on_attach}
lua require'nvim_lsp'.tsserver.setup{on_attach=require'completion'.on_attach}
lua require'nvim_lsp'.jsonls.setup{on_attach=require'completion'.on_attach}
lua require'nvim_lsp'.jdtls.setup{on_attach=require'completion'.on_attach}

" COMPLETITION

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
"let g:completion_enable_auto_popup = 0 " does not trigger automatically autocomplete
imap <silent> <c-f> <Plug>(completion_trigger)

nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>

