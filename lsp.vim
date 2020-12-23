"LSP STUFF
set signcolumn=yes
set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['substring', 'exact', 'fuzzy']

lua require'lspconfig'.tsserver.setup{on_attach=require'completion'.on_attach}
lua require'lspconfig'.gopls.setup{on_attach=require'completion'.on_attach}
lua require'lspconfig'.clangd.setup{on_attach=require'completion'.on_attach}


nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent>K  <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <Leader>i  <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> <Leader>r  <cmd>lua vim.lsp.buf.rename()<CR>

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

nmap <tab> <Plug>(completion_smart_tab)
nmap <s-tab> <Plug>(completion_smart_s_tab)

let g:completion_enable_auto_popup = 0 " does not trigger automatically autocomplete
imap    <silent> <c-f> <Plug>(completion_trigger)
let g:completion_enable_snippet = 'UltiSnips'
syntax on
colorscheme colorscheme
hi SignColumn ctermbg=0
