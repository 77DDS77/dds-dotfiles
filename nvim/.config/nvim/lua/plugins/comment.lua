--NORMAL MODE--
-- `gcc` - Toggles the current line using linewise comment
-- `gbc` - Toggles the current line using blockwise comment
-- `[count]gcc` - Toggles the number of line given as a prefix-count using linewise
-- `[count]gbc` - Toggles the number of line given as a prefix-count using blockwise
-- `gc[count]{motion}` - (Op-pending) Toggles the region using linewise comment
-- `gb[count]{motion}` - (Op-pending) Toggles the region using blockwise comment

--VISUAL MODE
-- `gc` - Toggles the region using linewise comment
-- `gb` - Toggles the region using blockwise comment

-- TODO COMMENTS HIGLIGHT
-- TODO: asd

return {
	{
		"numToStr/Comment.nvim",
		opts = {
			-- add any options here
		},
		config = function()
			require("Comment").setup({
				padding = true,
				sticky = true,
				ignore = nil,
				toggler = {
					line = "<leader>/",
					block = "gbc",
				},
				opleader = {
					line = "gc",
					block = "gb",
				},
				extra = {
					above = "gcO",
					below = "gco",
					eol = "gcA",
				},
				mappings = {
					basic = true,
					extra = true,
				},
				---Function to call before (un)comment
				pre_hook = nil,
				-- Function to call after (un)comment
				post_hook = nil,
			})
		end,
	},
	{
		-- Con questo plugin puoi evidenziare questi commenti
		-- FIX: foo bar
		-- TODO: foo bar
		-- HACK: foo bar
		-- WARN: foo bar
		-- PERF: foo bug
		-- NOTE: foo bar
		-- TEST: foo bar
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			keywords = {
				FIX = {
					icon = " ", -- icon used for the sign, and in search results
					color = "error", -- can be a hex color, or a named color (see below)
					alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
					-- signs = false, -- configure signs for some keywords individually
				},
				TODO = { icon = " ", color = "info" },
				HACK = { icon = " ", color = "warning" },
				WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
				PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
				NOTE = { icon = " ", color = "hint", alt = { "INFO", "?NOTE" } },
				TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
			},
			highlight = {
				pattern = {
					[[\b(KEYWORDS)\s*:]], -- Pattern per le parole chiave standard
					[[\b%?\s*:]], -- Pattern per il punto interrogativo
				},
			},
			search = {
				pattern =  {
					[[\b(KEYWORDS)\s*:]], -- Pattern per le parole chiave standard
					[[\b%?\s*:]], -- Pattern per il punto interrogativo
				},
			},
		},
		config = function()
			require("todo-comments.").setup()
		end,
	},
	{},
}
