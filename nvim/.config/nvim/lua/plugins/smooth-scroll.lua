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
			["<C-u>"] = function()
				neoscroll.scroll(-vim.wo.scroll, { move_cursor = true, duration = 250 })
			end,
			["<C-d>"] = function()
				neoscroll.scroll(vim.wo.scroll, { move_cursor = true, duration = 250 })
			end,
			["<C-S-g>"] = function()
				neoscroll.scroll(-vim.api.nvim_win_get_height(0), { move_cursor = true, duration = 450 })
			end,
			["<C-g>"] = function()
				neoscroll.scroll(vim.api.nvim_win_get_height(0), { move_cursor = true, duration = 450 })
			end,
			["<C-y>"] = function()
				neoscroll.scroll(-0.1, { move_cursor = false, duration = 100 })
			end,
			["<C-e>"] = function()
				neoscroll.scroll(0.1, { move_cursor = false, duration = 100 })
			end,
            ["<ScrollWheelUp>"] = function()
				neoscroll.scroll(-3, { move_cursor = false, duration = 50 })
			end,
			["<ScrollWheelDown>"] = function()
				neoscroll.scroll(3, { move_cursor = false, duration = 50 })
			end,
		}

		local modes = { "n", "v", "x" }
		for key, func in pairs(keymap) do
			vim.keymap.set(modes, key, func)
		end
	end,
}
