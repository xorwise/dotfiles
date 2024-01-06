return {
    {
        {
            "williamboman/mason-lspconfig.nvim",
            dependencies = {
                "williamboman/mason.nvim",
            },
            config = function()
                require("mason").setup({})
                require("mason-lspconfig").setup({
                    ensure_installed = {
                        "pyright",
                        "clangd",
                        "cssls",
                        "eslint",
                        "html",
                        "tsserver",
                    },
                    automatic_installation = true,
                    handlers = {
                        function(server_name) -- default handler (optional)
                            require("lspconfig")[server_name].setup {}
                        end,
                    },
                })
            end,
        },
        {
            "neovim/nvim-lspconfig",
            config = function()
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
            end
        },
        { "hrsh7th/cmp-nvim-lsp" },

        {
            "hrsh7th/nvim-cmp",
            config = function()
                local cmp = require('cmp')

                cmp.setup({
                    mapping = cmp.mapping.preset.insert({
                        -- `Enter` key to confirm completion
                        ['<CR>'] = cmp.mapping.confirm({ select = false }),

                        -- Ctrl+Space to trigger completion menu
                        ['<C-Space>'] = cmp.mapping.complete(),

                        -- Scroll up and down in the completion documentation
                        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                        ['<C-d>'] = cmp.mapping.scroll_docs(4),
                    })
                })
            end
        },
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
