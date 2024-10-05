require("fitz.lazy")
require("fitz.colorscheme")
require("fitz.lsp")
require("fitz.fzf")
require("fitz.treesitter")
require("fitz.oil")
require("fitz.lualine")
require("fitz.dbui")
require("fitz.beautify")
require("fitz.dbcsvexporter")
require("fitz.conform")

vim.opt.guicursor=''
vim.opt.fillchars:append { eob = " " }
vim.keymap.set('n', '<C-s>', ':w<cr>')
vim.keymap.set('n', '<C-l>q', ':noh<cr>')
vim.keymap.set('n', '<leader>q', ':bd<cr>')
vim.cmd [[map <C-Left> :tabprev<cr>]]
vim.cmd [[map <C-Right> :tabnext<cr>]]

vim.cmd[[filetype on]]
vim.cmd[[filetype indent on]]
vim.cmd[[filetype plugin on]]
vim.cmd[[filetype indent plugin on]]
vim.o.tabstop=4
vim.o.shiftwidth=4
vim.o.splitright=true
vim.o.ls = 3
vim.o.statusline = '    %f %m | %l:%c %L%=%P'
vim.o.backup = false
vim.o.swapfile = false
vim.o.writebackup = false
vim.o.autoread = true
vim.o.hlsearch=false

-- use inside of a terminal
vim.cmd 'tnoremap <Esc> <C-\\><C-n>'
vim.cmd [[set hidden]]

-- Remap copy to clipboard
vim.api.nvim_set_keymap('n', 'gy', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'gy', '"+y', { noremap = true, silent = true })

-- Remap paste from clipboard
vim.api.nvim_set_keymap('n', 'gp', '"+p', { noremap = true, silent = true })
