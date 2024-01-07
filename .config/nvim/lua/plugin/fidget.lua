return {
    "j-hui/fidget.nvim",
    config = function()
        require("fidget").setup({
            notification = {
                window = {
                    winblend = 0,
                    relative = "editor",
                },
            },
            integration = {
                ["nvim-tree"] = {
                    enable = false, -- Integrate with nvim-tree/nvim-tree.lua (if installed)
                },
            },
        })
    end,
}
