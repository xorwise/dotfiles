vim.g.mapleader = " "

vim.keymap.set("n", "<leader>e", ":NvimTreeFocus<CR>", { noremap = true })

-- Move to previous/next
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")


-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("n", "gd", function()
    vim.lsp.buf.definition()
end)
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>pep", function()
    vim.lsp.buf.format()
end)
vim.keymap.set("n", "<leader>rn", function()
    vim.lsp.buf.rename()
end)
vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { desc = "[G]oto [I]mplementation" })
vim.keymap.set("n", "<leader>ca", function()
    vim.lsp.buf.code_action()
end)

vim.keymap.set("n", "<leader>b", [[:w<CR>:!clang++ % -o %<.out && %<.out<CR>]])

vim.keymap.set("n", "<leader>tc", function()
    require("neotest").run.run()
end)
vim.keymap.set("n", "<leader>tt", function()
    require("neotest").run.attach()
end)
vim.keymap.set("n", "<leader>ts", function()
    require("neotest").summary()
end)


vim.api.nvim_set_keymap('n', '<C-h>', ':TmuxNavigateLeft<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', ':TmuxNavigateDown<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', ':TmuxNavigateUp<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', ':TmuxNavigateRight<CR>', { noremap = true, silent = true })

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local new_opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, new_opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, new_opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, new_opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, new_opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, new_opts)
        vim.lsp.buf.format { async = true }
    end,
})

vim.keymap.set("n", "<leader>rr", ":LspRestart<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader><Tab>", ":bp<CR>", { noremap = true, silent = true })
