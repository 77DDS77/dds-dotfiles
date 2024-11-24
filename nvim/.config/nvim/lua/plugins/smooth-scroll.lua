return {
	"karb94/neoscroll.nvim",
	config = function()
		require("neoscroll").setup({
			-- Configura le opzioni desiderate
			hide_cursor = true,
			stop_eof = true,
			respect_scrolloff = false,
			cursor_scrolls_alone = true,
			easing = "quadratic", -- Funzione di easing predefinita
			-- Altre opzioni...
		})

		-- Definisci i mapping personalizzati
		local neoscroll = require("neoscroll")
		local keymap = {
			["<C-k>"] = function()
				neoscroll.scroll(-vim.wo.scroll, true, 250)
			end,
			["<C-j>"] = function()
				neoscroll.scroll(vim.wo.scroll, true, 250)
			end,
			["<C-S-g>"] = function()
				neoscroll.scroll(-vim.api.nvim_win_get_height(0), true, 450)
			end,
			["<C-g>"] = function()
				neoscroll.scroll(vim.api.nvim_win_get_height(0), true, 450)
			end,
			["<C-y>"] = function()
				neoscroll.scroll(-0.10, false, 100)
			end,
			["<C-e>"] = function()
				neoscroll.scroll(0.10, false, 100)
			end,
		}
		local modes = { "n", "v", "x" }
		for key, func in pairs(keymap) do
			vim.keymap.set(modes, key, func)
		end
	end,
}
