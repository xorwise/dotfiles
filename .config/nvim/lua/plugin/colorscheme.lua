return {
	"rebelot/kanagawa.nvim",
	config = function()
		require("lualine").setup({
			options = {
				theme = "auto",
			},
		})
		vim.cmd("colorscheme kanagawa-dragon")
	end,
}
