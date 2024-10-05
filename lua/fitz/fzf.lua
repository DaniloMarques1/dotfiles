require"fzf-lua".setup({"telescope"})
vim.keymap.set("n", "<c-P>", require('fzf-lua').files, { desc = "Fzf Files" })
vim.keymap.set("n", "<leader>g", require('fzf-lua').live_grep, { desc = "grep string inside file" })
vim.keymap.set("n", "<leader>b", require('fzf-lua').buffers, { desc = "Fzf bufffers" })
