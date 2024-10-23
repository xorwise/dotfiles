return {
    {
        "hrsh7th/nvim-cmp",
        dependencies = {

            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")
            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    -- `Enter` key to confirm completion
                    ["<CR>"] = cmp.mapping.confirm({ select = false }),

                    -- Open completion menu
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-l>"] = cmp.mapping.complete(),
                    -- Scroll up and down in the completion documentation
                    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-d>"] = cmp.mapping.scroll_docs(4),
                    ['<C-j>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
                    ['<C-k>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
                }),
                sources = cmp.config.sources(
                    {
                        { name = "nvim_lsp" },
                        { name = "codeium" },
                    }
                ),
                formatting = {
                    format = function(entry, vim_item)
                        -- Source
                        vim_item.menu = ({
                            buffer = "[Buffer]",
                            nvim_lsp = "[LSP]",
                            nvim_lua = "[Lua]",
                            codeium = "[AI]",
                        })[entry.source.name]
                        return vim_item
                    end
                },
            })

            cmp.setup.filetype({ "sql" }, {
                sources = {
                    { name = "vim-dadbod-completion" },
                    { name = "buffer" },
                },
            })
        end,
    },
}
