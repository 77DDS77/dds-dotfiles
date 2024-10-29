return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "helix",
		win = {
			padding = { 1, 3 },
		},
	},
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 50
	end,
}
