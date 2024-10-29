return {
	"akinsho/bufferline.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local bufferline = require("bufferline")

		local delete_buffer = function()
			local bufnr = vim.api.nvim_get_current_buf()
			vim.api.nvim_buf_delete(bufnr, {})
		end

		vim.keymap.set("n", "<A-m>", ":BufferLineMoveNext<CR>", { desc = "Move buffer right" })
		vim.keymap.set("n", "<A-n>", ":BufferLineMovePrev<CR>", { desc = "Move buffer left" })
		vim.keymap.set("n", "<A-.>", ":BufferLineCycleNext<CR>", { desc = "Next buffer" })
		vim.keymap.set("n", "<A-,>", ":BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
		vim.keymap.set("n", "<A-c>", delete_buffer, { desc = "Delete buffer" })

		for i = 1, 9, 1 do
			vim.keymap.set(
				"n",
				"<leader>b" .. i,
				":lua require'bufferline'.go_to_buffer(" .. i .. ", true)<CR>",
				{ desc = "[B]uffer [" .. i .. "]" }
			)
		end

        local underline_green = "#97CA72"
        local underline_red = "#FA0305"
        local unused = ""

        --TODO trovare una maniera per cambiare dinamicamente
        --underline_color in base ai diagnostics
		local underline_color = underline_green

		bufferline.setup({
			options = {
				numbers = "ordinal",
				diagnostics = "nvim_lsp",
				indicator = {
					style = "underline",
				},

				max_name_length = 30,
				max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
				tab_size = 30,
				truncate_names = false,
				custom_areas = {
					right = function()
						local result = {}
						local seve = vim.diagnostic.severity
						local error = #vim.diagnostic.get(0, { severity = seve.ERROR })
						local warning = #vim.diagnostic.get(0, { severity = seve.WARN })
						local info = #vim.diagnostic.get(0, { severity = seve.INFO })
						local hint = #vim.diagnostic.get(0, { severity = seve.HINT })

						if error ~= 0 then
							table.insert(result, { text = "  " .. error, link = "DiagnosticError" })
                            underline_color = underline_red
                        else
                            underline_color = underline_green
						end

						if warning ~= 0 then
							table.insert(result, { text = "  " .. warning, link = "DiagnosticWarn" })
						end

						if hint ~= 0 then
							table.insert(result, { text = "  " .. hint, link = "DiagnosticHint" })
						end

						if info ~= 0 then
							table.insert(result, { text = "  " .. info, link = "DiagnosticInfo" })
						end
						return result
					end,
				},
			},
			highlights = {
				buffer_selected = {
					underline = true,
					sp = underline_color,
				},
				indicator_selected = {
					sp = underline_color,
					underline = true,
				},
				close_button_selected = {
					underline = true,
					sp = underline_color,
				},
				numbers_selected = {
					underline = true,
					sp = underline_color,
				},
				modified_selected = {
					underline = true,
					sp = underline_color,
				},
				duplicate_selected = {
					underline = true,
					sp = underline_color,
				},
				hint = {
					underline = true,
					sp = underline_color,
				},
				-- hint_diagnostic = {
				-- 	underline = true,
				-- 	sp = underline_color,
				-- },
				hint_selected = {
					underline = true,
					sp = underline_color,
				},
				hint_diagnostic_selected = {
					underline = true,
					sp = underline_color,
				},
				error = {
					underline = true,
					sp = underline_color,
				},
				error_diagnostic = {
					underline = true,
					sp = underline_color,
				},
				error_selected = {
					underline = true,
					sp = underline_color,
				},
				error_diagnostic_selected = {
					underline = true,
					sp = underline_color,
				},
			},
		})
	end,
}
