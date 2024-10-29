return {
	{
		-- mini move, per muovere blocchi di codice con Alt + hjkl
		"echasnovski/mini.move",
		version = "*",
		config = function()
			require("mini.move").setup()
		end,
	},
}
