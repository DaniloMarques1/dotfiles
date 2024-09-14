function configureTelescopne()
	-- You dont need to set any of these options. These are the default ones. Only
	-- the loading is important
	local telescope = require('telescope')
	telescope.setup {
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
	telescope.load_extension('fzf')

	local builtin = require("telescope.builtin")
	vim.keymap.set("n", "<C-p>", function()
		-- builtin.find_files()
		builtin.find_files(require('telescope.themes').get_ivy({hidden = true}))
	end, {})
	vim.keymap.set("n", "<leader>bb", function()
		builtin.buffers(require('telescope.themes').get_ivy({}))
	end, {})
	vim.keymap.set("n", "<leader>gg", function()
		builtin.live_grep(require('telescope.themes').get_ivy({}))
	end, {})
	vim.keymap.set("n", "<leader>rf", function()
		builtin.lsp_references(require('telescope.themes').get_ivy({}))
	end, {})
end

configureTelescopne()
