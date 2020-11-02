call plug#begin('~/.vim/plugged')
  "Plug 'neoclide/coc.nvim', {'branch': 'release'}

  Plug 'sheerun/vim-polyglot'
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-lua/completion-nvim'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

call plug#end()

let mapleader = " "
syntax on
colorscheme colorscheme

set guicursor=
set number
set incsearch
set expandtab
set nobackup
set nowritebackup
set noswapfile
set updatetime=100
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set shortmess+=c

noremap :W :w
noremap :Q :q
noremap <leader>t :terminal<cr>
noremap <leader>j 5j<cr>
noremap <leader>k 5k<cr>
noremap <leader>q :bd<cr>
noremap <leader>e :Explore<cr>
noremap <C-l> :noh<cr>

noremap <leader>ss :set syn=

"LSP STUFF
set completeopt=menuone,noinsert,noselect
"let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:completion_matching_strategy_list = ['substring', 'exact', 'fuzzy']

lua require'nvim_lsp'.tsserver.setup{ on_attach=require'completion'.on_attach }
lua require'nvim_lsp'.gopls.setup{ on_attach=require'completion'.on_attach }
lua require'nvim_lsp'.clangd.setup{ on_attach=require'completion'.on_attach }

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

" FZF stuff
noremap <Leader>p    :GFiles<CR>
noremap <leader>f    :Files<CR>
noremap <Leader>b    :Buffers<CR>
