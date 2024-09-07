require("fitz.colorscheme")
require("fitz.lsp")
require("fitz.telescope")
require("fitz.treesitter")
require("fitz.oil")
require("fitz.evil_lualine")

vim.g.mapleader = " "
--vim.opt.guicursor=''
--vim.opt.fillchars:append { eob = " " }
vim.keymap.set('n', '<C-s>', ':w<cr>')
vim.keymap.set('n', '<C-l>q', ':noh<cr>')
vim.keymap.set('n', '<leader>q', ':bd<cr>')
vim.o.number=false
vim.cmd [[map <C-Left> :tabprev<cr>]]
vim.cmd [[map <C-Right> :tabnext<cr>]]

vim.cmd[[filetype on]]
vim.cmd[[filetype indent on]]
vim.cmd[[filetype plugin on]]
vim.cmd[[filetype indent plugin on]]
vim.opt.tabstop=4
vim.opt.shiftwidth=4
vim.o.splitright=true
vim.o.ls = 3
vim.o.statusline = '    %f %m | %l:%c %L%=%P'
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.writebackup = false
vim.opt.autoread = true
vim.opt.hlsearch=false

-- use inside of a terminal
vim.cmd 'tnoremap <Esc> <C-\\><C-n>'
vim.cmd [[set hidden]]
vim.cmd [[let g:netrw_liststyle = 3]]
vim.cmd [[let g:netrw_browse_split = 4]]
--vim.cmd [[let g:netrw_keepdir = 0]]
vim.cmd [[let g:netrw_altv = 1]]
vim.cmd [[let g:netrw_banner = 0]]
vim.cmd [[let g:netrw_list_hide=netrw_gitignore#Hide()]]

function ToggleNetrw()
    if vim.bo.filetype == 'netrw' then
        vim.cmd('q')
    else
        vim.cmd('Vex!')
    end
end

vim.api.nvim_set_keymap('n', '<C-n>', ':lua ToggleNetrw()<CR>', { silent = true })
