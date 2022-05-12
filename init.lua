vim.g.mapleader = ' '

vim.cmd[[colorscheme sitruuna]]

vim.g.mapleader = ' '
vim.opt.syntax = 'enable'
vim.opt.autoindent = true
vim.opt.autoread = true
vim.opt.smartindent = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.hlsearch = true
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.cmd[[map <C-s> :w<cr>]]
vim.cmd[[nnoremap <C-l> :noh<cr>]]
vim.cmd[[nnoremap <leader>q :q<cr>]]

vim.cmd[[map <C-Left> :tabprev<cr>]]
vim.cmd[[map <C-Right> :tabnext<cr>]]

vim.cmd[[map <F12> :!go fmt ./...<cr>]]

vim.cmd[[tnoremap <Esc> <C-\\><C-n>]]
vim.cmd[[nnoremap <leader>sh <cmd>sp term://bash <cr>]]
vim.cmd[[set hidden]]

vim.o.statusline = '   %f %m | %P%=%l:%c %L'
vim.o.ls = 3

-- "fixing" colorschemes
-- for vi(m) colorschemes
vim.cmd [[hi Todo ctermbg=none ctermfg=13 cterm=none]]
vim.cmd [[hi TabLineFill ctermbg=none ctermfg=234 cterm=none]]
vim.cmd [[hi TabLine ctermbg=none ctermfg=248 cterm=none]]
vim.cmd [[hi TabLineSel ctermbg=none ctermfg=252]]
vim.cmd [[hi LineNr ctermbg=none ctermfg=245]]
--vim.cmd [[hi String ctermbg=none ctermfg=202]]
vim.cmd [[hi Comment ctermbg=none ctermfg=149]]
vim.cmd [[hi StatusLine ctermbg=235 ctermfg=253]]
vim.cmd [[hi StatusLineNC ctermbg=235 ctermfg=243]]
vim.cmd [[hi WinSeparator ctermbg=None]]

-- for neovim colorschemes
--cmd 'hi Todo guibg=none guifg=ff00ff gui=none'
--cmd 'hi TabLineFill guibg=none guifg=#1c1c1c gui=none'
--cmd 'hi TabLine guibg=none guifg=#8a8a8a gui=none'
--cmd 'hi TabLineSel guibg=none guifg=#d0d0d0'
--cmd 'hi LineNr guibg=none guifg=#8a8a8a gui=none'
--cmd 'hi String guibg=none guifg=#d787d7 gui=none'
--cmd 'hi Comment guibg=none guifg=#afd75f gui=none'
--cmd 'hi StatusLine guibg=#262626 guifg=#dadada gui=none'
--cmd 'hi StatusLineNC guibg=#262626 guifg=#767676 gui=none'
--cmd 'hi WinSeparator guibg=None'
