return {
	{
		-- CATPPUCCIN
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		priority = 1000,
		config = function()
            require("catppuccin").setup({
                flavour="frappe",
                -- flavour="macchiato",
                term_colors = true
            })
			vim.cmd.colorscheme("catppuccin")
		end,
	},
	{
		-- KANAGAWA
		-- "rebelot/kanagawa.nvim",
		-- config = function()
		--   vim.cmd.colorscheme("kanagawa-wave")
		--   -- vim.cmd.colorscheme("kanagawa-lotus") --light-theme
		--   vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#51B3EC", bold = true })
		--   vim.api.nvim_set_hl(0, "LineNr", { fg = "white", bold = true })
		--   vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#FB508F", bold = true })
		-- end,
	},
	{
		-- ONEDARK
		-- "navarasu/onedark.nvim",
		-- config = function()
		-- 	require("onedark").setup({
		-- 		-- Main options --
		-- 		style = "cool", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
		-- 	})
		--
		-- 	vim.cmd.colorscheme("onedark")
		-- 	vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#51B3EC", bold = true })
		-- 	vim.api.nvim_set_hl(0, "LineNr", { fg = "white", bold = true })
		-- 	vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#FB508F", bold = true })
		-- end,
	},
}
