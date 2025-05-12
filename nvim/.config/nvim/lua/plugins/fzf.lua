return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	dependencies = { "nvim-tree/nvim-web-devicons" },
    event="VeryLazy",
	config = function()
		-- calling `setup` is optional for customization
		vim.keymap.set("n","<c-P>","<cmd>lua require('fzf-lua').files( { resume = true} )<CR>",{ desc = "FzF Files" })
		vim.keymap.set("n", "<leader>fg", "<cmd>FzfLua live_grep<CR>", { desc = "FzF livegrep" })
		vim.keymap.set("n", "<leader>fw", "<cmd>FzfLua grep_cword<CR>", { desc = "FzF find word" })
		vim.keymap.set("n", "<leader>fW", "<cmd>FzfLua grep_cWORD<CR>", { desc = "FzF find WORD" })
		vim.keymap.set("n", "gr", "<cmd>FzfLua lsp_references<CR>", { desc = "FzF Get References" })
		vim.keymap.set("n", "gI", "<cmd>FzfLua lsp_implementations<CR>", { desc = "FzF Get Implementation" })
		require("fzf-lua").setup({})
	end,
}
