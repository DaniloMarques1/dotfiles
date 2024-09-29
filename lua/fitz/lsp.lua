local on_attach = function(client, bufnr)
	vim.cmd[[set completeopt=menu]]
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
	client.server_capabilities.semanticTokensProvider = {}
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
	vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
	vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
	vim.keymap.set('n', '<space>d', vim.diagnostic.setloclist, opts)
	vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
end

local configureLsp = function()
	require("mason").setup()
	require('mason-lspconfig').setup {
		handlers = {
			function(server_name)
				-- This handles overriding only values explicitly passed
				-- by the server configuration above. Useful when disabling
				-- certain features of an LSP (for example, turning off formatting for ts_ls)
				--server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
				require('lspconfig')[server_name].setup {
					on_attach = on_attach,
				}
			end,
		},
	}

	vim.diagnostic.config {
		virtual_text = false,
		signs = false,
		underline = true,
	}

	-- vim.cmd [[autocmd BufWritePre *.go lua vim.lsp.buf.format()]]
	-- vim.cmd [[autocmd BufWritePre *.ts lua vim.lsp.buf.format()]]
	-- vim.cmd [[autocmd BufWritePre *.tsx lua vim.lsp.buf.format()]]
	-- vim.cmd [[autocmd BufWritePre *.js lua vim.lsp.buf.format()]]
	-- vim.cmd [[autocmd BufWritePre *.jsx lua vim.lsp.buf.format()]]
	-- vim.cmd [[autocmd BufWritePre *.html lua vim.lsp.buf.format()]]
	-- vim.cmd [[autocmd BufWritePre *.css lua vim.lsp.buf.format()]]
	--
	-- vim.api.nvim_create_autocmd('BufWritePre', {
	-- 	pattern = {'*.tsx', '*.ts', '*.js', '*.jsx'},
	-- 	command = 'silent! EslintFixAll',
	-- 	group = vim.api.nvim_create_augroup('Format', {})
	-- })

	ToggleCmp()
end

function ToggleCmp()
	-- Set up nvim-cmp.
	local cmp = require'cmp'
	cmp.setup({
		mapping = cmp.mapping.preset.insert({
			['<C-b>'] = cmp.mapping.scroll_docs(-4),
			['<C-f>'] = cmp.mapping.scroll_docs(4),
			['<C-Space>'] = cmp.mapping.complete(),
			['<C-e>'] = cmp.mapping.abort(),
			['<C-s>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		}),
		sources = cmp.config.sources({
			{ name = 'nvim_lsp' },
			{ name = 'nvim-path' },
			{ name = 'buffer' },
		})
	})

	cmp.setup.filetype({ 'sql' }, {
		sources = {
			{ name = 'vim-dadbod-completion' },
			{ name = 'buffer' },
		},
	})
end


configureLsp()

