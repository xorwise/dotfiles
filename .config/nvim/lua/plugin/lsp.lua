-- ~/.config/nvim/lua/plugin/lsp.lua  (loaded by Lazy)
return {
	---------------------------------------------------------------------------┐
	-- Mason (downloads language-servers, linters, formatters)                 │
	---------------------------------------------------------------------------┘
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},

	---------------------------------------------------------------------------┐
	-- mason-lspconfig                                                         │
	--   * only INSTALLS servers (no auto-enable)                              │
	---------------------------------------------------------------------------┘
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = "williamboman/mason.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"pyright",
					"gopls",
					"lua_ls",
					"clangd",
					"efm",
				},
				automatic_enable = false, -- ‹ turn OFF auto-attaching ›
			})
		end,
	},

	---------------------------------------------------------------------------┐
	-- nvim-lspconfig  → the **only** place that attaches servers              │
	---------------------------------------------------------------------------┘
	{
		"neovim/nvim-lspconfig",
		dependencies = { "williamboman/mason-lspconfig.nvim", "hrsh7th/cmp-nvim-lsp" },
		config = function()
			local lspconfig = require("lspconfig")
			local caps = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

			-- on_attach: disable native formatting for servers handled by EFM
			local function on_attach(client, bufnr)
				if client.name == "gopls" or client.name == "pyright" or client.name == "clangd" then
					client.server_capabilities.documentFormattingProvider = false
				end
				if client.server_capabilities.documentFormattingProvider then
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ async = false })
						end,
						desc = "LSP format-on-save",
					})
				end
			end

			-----------------------------------------------------------------------┐
			-- 1. Native language-servers                                          │
			-----------------------------------------------------------------------┘
			for _, srv in ipairs({ "pyright", "gopls", "lua_ls", "clangd" }) do
				local opts = { on_attach = on_attach, capabilities = caps }
				if srv == "lua_ls" then
					opts.settings = {
						Lua = {
							diagnostics = { globals = { "vim" } },
							workspace = { library = vim.api.nvim_get_runtime_file("", true) },
						},
					}
				end
				lspconfig[srv].setup(opts)
			end

			-----------------------------------------------------------------------┐
			-- 2. EFM bridge (formatters & linters)                                │
			-----------------------------------------------------------------------┘
			lspconfig.efm.setup({
				init_options = { documentFormatting = true },
				settings = {
					rootMarkers = { ".git/" },
					languages = {
						python = {
							{ formatCommand = "black --quiet -", formatStdin = true },
							{ formatCommand = "isort --stdout --profile black -", formatStdin = true },
							{
								lintCommand = "flake8 --stdin-display-name ${INPUT} -",
								lintStdin = true,
								lintFormats = { "%f:%l:%c: %m" },
							},
						},
						javascript = {
							{ formatCommand = "prettier --stdin-filepath ${INPUT}", formatStdin = true },
							{
								lintCommand = "eslint_d --stdin --stdin-filename ${INPUT}",
								lintStdin = true,
								lintFormats = { "%f:%l:%c: %m" },
							},
						},
						typescript = {
							{ formatCommand = "prettier --stdin-filepath ${INPUT}", formatStdin = true },
							{
								lintCommand = "eslint_d --stdin --stdin-filename ${INPUT}",
								lintStdin = true,
								lintFormats = { "%f:%l:%c: %m" },
							},
						},
						lua = {
							{ formatCommand = "stylua -", formatStdin = true },
						},
						go = {
							{ formatCommand = "gofmt", formatStdin = true },
							{
								lintCommand = "golangci-lint run --out-format tab",
								lintStdin = false,
								lintFormats = { "%f:%l:%c: %m" },
							},
						},
					},
				},
				filetypes = { "python", "javascript", "typescript", "lua", "go" },
				on_attach = on_attach,
				capabilities = caps,
			})
		end,
	},
}
