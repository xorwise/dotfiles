require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {
        side = "right",
        width = 40,
        adaptive_size = true,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
})
