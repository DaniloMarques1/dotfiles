vim.g.mapleader = " "
vim.keymap.set('n', '<space>d', vim.diagnostic.setloclist, opts)
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    client.server_capabilities.semanticTokensProvider = {}
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
	vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
end

require('lspconfig').gopls.setup{
	on_attach = on_attach,
}

vim.diagnostic.config {
    virtual_text = false,
    signs = false,
    underline = false,
}

vim.cmd [[autocmd BufWritePre *.go lua vim.lsp.buf.format()]]
vim.cmd [[autocmd BufWritePre *.ts lua vim.lsp.buf.format()]]
vim.cmd [[autocmd BufWritePre *.tsx lua vim.lsp.buf.format()]]
vim.cmd [[autocmd BufWritePre *.js lua vim.lsp.buf.format()]]
vim.cmd [[autocmd BufWritePre *.jsx lua vim.lsp.buf.format()]]
vim.cmd [[autocmd BufWritePre *.html lua vim.lsp.buf.format()]]
vim.cmd [[autocmd BufWritePre *.css lua vim.lsp.buf.format()]]

-- 
--vim.api.nvim_create_autocmd('BufWritePre', {
--    pattern = {'*.tsx', '*.ts', '*.js', '*.jsx'},
--    command = 'silent! EslintFixAll',
--    group = vim.api.nvim_create_augroup('Format', {})
--})

-- telescope
-- You dont need to set any of these options. These are the default ones. Only
-- the loading is important
require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", function()
	builtin.find_files(require('telescope.themes').get_ivy({}))
end, {})
vim.keymap.set("n", "<leader>bb", function()
	builtin.buffers(require('telescope.themes').get_ivy({}))
end, {})
vim.keymap.set("n", "<C-p>", function()
	builtin.git_files(require('telescope.themes').get_ivy({}))
end, {})
vim.keymap.set("n", "<leader>gg", function()
	builtin.live_grep(require('telescope.themes').get_ivy({}))
end, {})
vim.keymap.set("n", "<leader>rf", function()
	builtin.lsp_references(require('telescope.themes').get_ivy({}))
end, {})

-- fzf
--vim.keymap.set('n', '<leader>ff', ':Files<cr>')
--vim.keymap.set('n', '<leader>ag', ':Ag<cr>')
--vim.keymap.set('n', '<leader>bb', ':Buffers!<cr>')


vim.opt.guicursor=''
--vim.opt.fillchars:append { eob = " " }
vim.keymap.set('n', '<C-s>', ':w<cr>')
vim.keymap.set('n', '<C-l>q', ':noh<cr>')
vim.keymap.set('n', '<leader>q', ':bd<cr>')
vim.o.number=false
--vim.cmd[[colorscheme retrobox]]
vim.cmd[[colorscheme catppuccin]]
vim.keymap.set('n', '<c-n>', ':Vex!<cr>')

vim.cmd [[map <C-Left> :tabprev<cr>]]
vim.cmd [[map <C-Right> :tabnext<cr>]]

vim.cmd[[filetype on]]
vim.cmd[[filetype indent on]]
vim.cmd[[filetype plugin on]]
vim.cmd[[filetype indent plugin on]]
vim.opt.tabstop=4
vim.opt.shiftwidth=4
vim.o.splitright=true
vim.o.laststatus=1

-- use inside of a terminal
vim.cmd 'tnoremap <Esc> <C-\\><C-n>'
vim.cmd [[set hidden]]
vim.cmd [[let g:netrw_liststyle = 3]]
vim.cmd [[let g:netrw_browse_split = 4]]
vim.cmd [[let g:netrw_altv = 1]]
vim.cmd [[let g:netrw_winsize = 25]]
vim.cmd [[let g:netrw_winsize = 25]]
vim.cmd [[let g:netrw_banner = 0]]

-- treesitter
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "go" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = false,

  -- List of parsers to ignore installing (or "all")
  ignore_install = { "" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = {},
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
