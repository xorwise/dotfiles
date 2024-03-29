return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.4",
    -- or                              , branch = '0.1.x',
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
        vim.keymap.set("n", "<leader>fw", builtin.live_grep, {})
        vim.keymap.set("n", "<leader>fa", builtin.buffers, {})
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
        vim.keymap.set("n", "<C-p>", builtin.git_files, {})
        vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, { desc = "[G]oto [R]eferences" })
        vim.keymap.set('n', '/', function()
            builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
                previewer = false,
            }))
        end)
        require("telescope").setup({
            defaults = {
                file_ignore_patterns = {
                    "node_modules",
                    ".git",
                    ".venv",
                    "__pycache__",
                    "venv",
                    "site-packages",
                },
            },
        })

        require("telescope").load_extension("git_worktree")
        vim.keymap.set("n", "<leader>wt", function()
            require("telescope").extensions.git_worktree.git_worktrees()
        end)
        vim.keymap.set("n", "<leader>nt", function()
            require("telescope").extensions.git_worktree.create_git_worktree()
        end)
    end,
}
