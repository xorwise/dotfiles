return {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        local formatting = null_ls.builtins.formatting
        local diagnostics = null_ls.builtins.diagnostics
        local code_actions = null_ls.builtins.code_actions

        null_ls.setup({
            sources = {
                -- formatting
                formatting.stylua,
                formatting.black,
                -- diagnostics
                diagnostics.mypy.with({
                    extra_args = function()
                        local virtual = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX") or "/usr"
                        return { "--python-executable", virtual .. "/bin/python3", "--ignore-missing-imports" }
                    end,
                })
                ,
                diagnostics.ruff,
                -- code actions
                code_actions.refactoring,
            },
        })

        vim.api.nvim_create_autocmd("BufWritePre", {
            callback = function()
                -- check if null-ls exists
                -- check if a formatting source of null-ls is registered
                if null_ls.is_registered({ method = null_ls.methods.FORMATTING }) then
                    vim.lsp.buf.format()
                else
                    vim.cmd([[normal gg=G<C-o>]])
                end
            end,
        })
    end,
}
