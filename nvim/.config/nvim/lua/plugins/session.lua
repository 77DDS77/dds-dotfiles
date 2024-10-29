return {
	"folke/persistence.nvim",
	event = "BufReadPre", -- this will only start session saving when an actual file was opened

	config = function()
		require("persistence").setup({
			options = { --[[<other options>,]]
				"globals",
			},
			pre_save = function()
				vim.api.nvim_exec_autocmds("User", { pattern = "SessionSavePre" })
			end,
		})
	end,

	-- load the session for the current directory
	vim.keymap.set("n", "<leader>qs", function()
		require("persistence").load()
	end, { desc = "Load current directory session" }),

	-- select a session to load
	vim.keymap.set("n", "<leader>qS", function()
		require("persistence").select()
	end, { desc = "Session list" }),

	-- load the last session
	vim.keymap.set("n", "<leader>ql", function()
		require("persistence").load({ last = true })
	end, { desc = "Load last session" }),

	-- stop Persistence => session won't be saved on exit
	vim.keymap.set("n", "<leader>qd", function()
		require("persistence").stop()
	end, { desc = "Stop persistence, session won't be saved on exit" }),
}
