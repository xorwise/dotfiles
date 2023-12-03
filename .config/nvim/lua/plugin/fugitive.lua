return {
    "tpope/vim-fugitive",
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
