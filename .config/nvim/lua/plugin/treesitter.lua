return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local treesitter = require('nvim-treesitter.configs')
            treesitter.setup({
                ensure_installed = { 'lua', 'vim', 'vimdoc', 'query', 'python', 'html', 'css', 'javascript', 'typescript' },
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = true,
                },
                indent = {
                    enable = true,
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = '<CR>',
                        node_incremental = '<CR>',
                        node_decremental = '<BS>',
                        scope_incremental = false,
                    }
                },
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true,
                        keymaps = {
                            ['af'] = '@function.outer',
                            ['if'] = '@function.inner',

                            ['ac'] = '@class.outer',
                            ['ic'] = '@class.inner',

                            ["ai"] = "@conditional.outer",
                            ["ii"] = "@conditional.inner",

                            ["al"] = "@loop.outer",
                            ["il"] = "@loop.inner",
                        }
                    }
                }
            })
        end,
    },
    {
        'nvim-treesitter/nvim-treesitter-context',
        dependecies = {
            'nvim-treesitter/nvim-treesitter'
        }
    },
    {
        'nvim-treesitter/nvim-treesitter-textobjects',
        dependecies = {
            'nvim-treesitter/nvim-treesitter'
        }
    }
}
