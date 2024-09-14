local on_attach = function(client, bufnr)
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
	local servers = {"gopls", "ts_ls", "jsonls", "dockerls", "eslint", "docker_compose_language_service", "lua_ls"}
	require("mason").setup()
	require("mason-lspconfig").setup({
		ensure_installed = servers
	})

	local lspConfig = require('lspconfig')
	for _, server in ipairs(servers) do
		lspConfig[server].setup {
			on_attach = on_attach
		}
	end

	vim.diagnostic.config {
		virtual_text = true,
		signs = false,
		underline = false,
	}

	vim.cmd [[autocmd BufWritePre *.go lua vim.lsp.buf.format()]]
	-- vim.cmd [[autocmd BufWritePre *.ts lua vim.lsp.buf.format()]]
	-- vim.cmd [[autocmd BufWritePre *.tsx lua vim.lsp.buf.format()]]
	-- vim.cmd [[autocmd BufWritePre *.js lua vim.lsp.buf.format()]]
	-- vim.cmd [[autocmd BufWritePre *.jsx lua vim.lsp.buf.format()]]
	vim.cmd [[autocmd BufWritePre *.html lua vim.lsp.buf.format()]]
	vim.cmd [[autocmd BufWritePre *.css lua vim.lsp.buf.format()]]

	vim.api.nvim_create_autocmd('BufWritePre', {
		pattern = {'*.tsx', '*.ts', '*.js', '*.jsx'},
		command = 'silent! EslintFixAll',
		group = vim.api.nvim_create_augroup('Format', {})
	})
	--
	--
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

