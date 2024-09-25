return {
    "tpope/vim-dadbod",
    "kristijanhusak/vim-dadbod-completion",
    {
        "kristijanhusak/vim-dadbod-ui",
        config = function()
            vim.keymap.set("n", "<leader>db", ":DBUIToggle<CR>", { noremap = true, silent = true })
        end,
    },
}
