local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
end)

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
        lsp.default_setup,
    }
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
    on_attach = lsp.on_attach,
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "off",
            },
        },
    },
})
