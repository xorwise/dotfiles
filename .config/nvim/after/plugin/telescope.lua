local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", function()
	builtin.find_files({
		find_command = {
			"rg",
			"--files",
			"--ignore-file",
			"~/.ignore",
			"--hidden",
			"-g",
			"!venv/*",
		},
	})
end, {})
vim.keymap.set("n", "<leader>fw", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, { desc = "[G]oto [R]eferences" })
require("telescope").setup({
	file_ignore_patterns = {
		"node_modules",
		".git",
		"venv",
		"site-packages",
	},
})
