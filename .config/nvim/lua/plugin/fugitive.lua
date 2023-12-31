return {
    {
        "tpope/vim-fugitive",
        config = function()
            vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
        end,
    },
    {
        "ThePrimeagen/git-worktree.nvim",
        config = function()
            require("git-worktree").setup()
        end,
    },
    {
        "hoob3rt/lualine.nvim",
        config = function()
            require("lualine").setup()
        end,
    },
}
