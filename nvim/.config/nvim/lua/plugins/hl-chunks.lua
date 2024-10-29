return {
	"shellRaining/hlchunk.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("hlchunk").setup({
			blank = {
				enable = false,
			},
			indent = {
				enable = true,
				chars = {
					"│",
				},
				style = "#414559"
			},
			chunk = {
				enable = true,
				chars = {
					horizontal_line = "─",
					vertical_line = "│",
					left_top = "╭",
					left_bottom = "╰",
					right_arrow = ">",
				},
				style = {
					"#ca9ee6", -- normal chunk
					"#e78284", -- chunk with errors
				},
				duration = 100,
				delay = 200,
			},
			line_num = {
				enable = true,
				style = "#ca9ee6",
			},
		})
	end,
}
