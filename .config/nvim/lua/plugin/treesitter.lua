return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        event = { "BufReadPre", "BufNewFile" }
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
