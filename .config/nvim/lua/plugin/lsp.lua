return {
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "rafamadriz/friendly-snippets",
        },
        build = "make install_jsregexp"
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
            "williamboman/mason.nvim",
        },
        config = function()
            require("mason").setup({})
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "pyright",
                    "clangd",
                    "cssls",
                    "html",
                    "gopls",
                    "eslint",
                },
                automatic_installation = true,
                handlers = {
                    function(server_name) -- default handler (optional)
                        require("lspconfig")[server_name].setup({})
                    end,
                },
            })
            require("lspconfig").lua_ls.setup({
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                    },
                },
            })
            require("lspconfig").pyright.setup({
                settings = {
                    python = {
                        analysis = {
                            typeCheckingMode = "off",
                        },
                    },
                },
            })
        end,
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
