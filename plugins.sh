#!/bin/bash

# List of all packages to install.
# Currently this requires that each package
# lives on github.com
PACKAGES=(
	# "nvim-telescope/telescope.nvim"
	# "nvim-lua/plenary.nvim"
	# "nvim-telescope/telescope-fzf-native.nvim"
	'junegunn/fzf'
	'junegunn/fzf.vim'
	"tpope/vim-fugitive"
	"neovim/nvim-lspconfig"
	'williamboman/mason.nvim'
	'williamboman/mason-lspconfig.nvim'
	"Mofiqul/vscode.nvim"
	"Shatur/neovim-ayu"
	"nvim-treesitter/nvim-treesitter"
	# 'hrsh7th/cmp-nvim-lsp'
	# 'hrsh7th/nvim-cmp'
	# 'hrsh7th/cmp-path'
	# 'hrsh7th/cmp-buffer'
)

mkdir -p /home/fitz/.local/share/nvim/site/pack/plugins/start
cd /home/fitz/.local/share/nvim/site/pack/plugins/start

for package in "${PACKAGES[@]}"
do
	git clone "https://github.com/$package" &
done
echo "done..."
