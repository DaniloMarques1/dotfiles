local colorscheme = function()
	require("catppuccin").setup {
		color_overrides = {
			all = {
				text = "#ffffff",
			},
			mocha = {
				base = "#131313",
				mantle = "#131313",
				crust = "#131313",
			},
			frappe = {},
			macchiato = {},
			latte = {},
		},
		highlight_overrides = {
			all = function(colors)
				return {
					WinSeparator = { fg = colors.overlay0, style = { "bold" } },
				}
			end
		}
	}

	vim.cmd.colorscheme "catppuccin-mocha"
end

colorscheme()
