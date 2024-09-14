vim.g.mapleader = " "
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-fzf-native.nvim",
			"nvim-tree/nvim-web-devicons" 
		}
	},
	"tpope/vim-fugitive",
	"neovim/nvim-lspconfig",
	'williamboman/mason.nvim',
	'williamboman/mason-lspconfig.nvim',
	"Mofiqul/vscode.nvim",
	"nvim-treesitter/nvim-treesitter",
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/nvim-cmp',
	'hrsh7th/cmp-path',
	'hrsh7th/cmp-buffer',
	'stevearc/oil.nvim',
	'nvim-lualine/lualine.nvim',
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	-- trying this out for sql queries
	'tpope/vim-dadbod',
	'kristijanhusak/vim-dadbod-ui',
	'kristijanhusak/vim-dadbod-completion',
})

