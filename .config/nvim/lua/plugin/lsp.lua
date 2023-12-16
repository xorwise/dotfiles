return {
    {
        { "VonHeikemen/lsp-zero.nvim" },
        --- Uncomment these if you want to manage LSP servers from neovim
        { "williamboman/mason.nvim" },
        { "williamboman/mason-lspconfig.nvim" },
        { "neovim/nvim-lspconfig" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/nvim-cmp" },
        { "L3MON4D3/LuaSnip" },
    },
    {
        "ray-x/lsp_signature.nvim",
        event = "VeryLazy",
        opts = {},
        config = function(_, opts)
            require("lsp_signature").setup(opts)
        end,
    },
}
