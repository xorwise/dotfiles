return {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
        local telescope = require("telescope")
        telescope.setup({
            defaults = {
                file_ignore_patterns = {
                    "node_modules",
                    ".git",
                    ".venv",
                    "__pycache__",
                    "venv",
                    "site-packages",
                },
                mappings = {
                    i = {
                        ["<C-j>"] = require("telescope.actions").move_selection_next,
                        ["<c-k>"] = require("telescope.actions").move_selection_previous,
                        ["<C-p>"] = false,
                        ["<C-n>"] = false,
                    }
                }
            },
        })
        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>ff", function()
            builtin.find_files({ hidden = true })
        end, {})
        vim.keymap.set("n", "<leader>fw", builtin.live_grep, {})
        vim.keymap.set("n", "<leader>fa", builtin.buffers, {})
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
        vim.keymap.set("n", "<C-p>", builtin.git_files, {})
        vim.keymap.set('n', '/', function()
            builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
                previewer = false,
            }))
        end)

        require("telescope").load_extension("git_worktree")
        vim.keymap.set("n", "<leader>wt", function()
            require("telescope").extensions.git_worktree.git_worktrees()
        end)
        vim.keymap.set("n", "<leader>nt", function()
            require("telescope").extensions.git_worktree.create_git_worktree()
        end)

        vim.keymap.set("n", "<leader>e", function()
            telescope.extensions.file_browser.file_browser()
        end)
    end,
}
