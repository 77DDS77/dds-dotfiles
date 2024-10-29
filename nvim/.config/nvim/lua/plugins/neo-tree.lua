return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
    event = 'VimEnter',
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	config = function()
		require("neo-tree").setup({
			filesystem = {
				follow_current_file = {
					enabled = true,
				},
			},
			window = {
				width = 40,
			},
		})
		vim.keymap.set("n", "<C-b>", ":Neotree filesystem toggle right<CR>", {})
	end,
}
