return {
    'dracula/vim',
    name = 'dracula',
    config = function()
        vim.cmd('colorscheme dracula')

        vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
        vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
    end,

}
