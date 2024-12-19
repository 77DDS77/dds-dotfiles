return {
	{
		"saghen/blink.cmp",
		lazy = false, -- lazy loading handled internally
		-- optional: provides snippets for the snippet source
		dependencies = "rafamadriz/friendly-snippets",

		-- use a release tag to download pre-built binaries
		version = "v0.*",
		-- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
		-- build = 'cargo build --release',
		-- If you use nix, you can build from source using latest nightly rust with:
		-- build = 'nix run .#build-plugin',

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			-- 'default' for mappings similar to built-in completion
			-- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
			-- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
			-- see the "default configuration" section below for full documentation on how to define
			-- your own keymap.
			keymap = {
				["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
				["<C-e>"] = { "hide", "fallback" },
				["<CR>"] = { "accept", "fallback" },

				["<Tab>"] = { "select_next", "fallback" },
				["<S-Tab>"] = { "select_prev", "fallback" },

				["<Up>"] = { "select_prev", "fallback" },
				["<Down>"] = { "select_next", "fallback" },
				["<C-p>"] = { "select_prev", "fallback" },
				["<C-n>"] = { "select_next", "fallback" },

				["<C-b>"] = { "scroll_documentation_up", "fallback" },
				["<C-f>"] = { "scroll_documentation_down", "fallback" },
			},

			appearance = {
				-- Sets the fallback highlight groups to nvim-cmp's highlight groups
				-- Useful for when your theme doesn't support blink.cmp
				-- will be removed in a future release
				use_nvim_cmp_as_default = true,
				-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
				-- Adjusts spacing to ensure icons are aligned
				nerd_font_variant = "mono",
			},

			-- default list of enabled providers defined so that you can extend it
			-- elsewhere in your config, without redefining it, via `opts_extend`
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
				-- optionally disable cmdline completions
				-- cmdline = {},
			},

			-- experimental signature help support
			-- signature = { enabled = true }

			completion = {
				list = {
					selection = "auto_insert",
				},
			},
		},
		-- allows extending the providers array elsewhere in your config
		-- without having to redefine it
		opts_extend = { "sources.default" },
	},
	-- {
	--
	-- 	"hrsh7th/nvim-cmp",
	-- 	event = "InsertEnter",
	-- 	dependencies = {
	-- 		"hrsh7th/cmp-buffer", -- source for text in buffer
	-- 		"hrsh7th/cmp-path", -- source for file system paths
	-- 		"L3MON4D3/LuaSnip", -- snippet engine
	-- 		"saadparwaiz1/cmp_luasnip", -- for autocompletion
	-- 		"rafamadriz/friendly-snippets", -- useful snippets
	-- 		"onsails/lspkind.nvim", -- vs-code like pictograms
	-- 	},
	-- 	enabled = true,
	-- 	config = function()
	-- 		local cmp = require("cmp")
	--
	-- 		local luasnip = require("luasnip")
	--
	-- 		local lspkind = require("lspkind")
	--
	--            local tailwindcss_colorizer_cmp = require("tailwindcss-colorizer-cmp")
	--
	-- 		local has_words_before = function()
	-- 			unpack = unpack or table.unpack
	-- 			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	-- 			return col ~= 0
	-- 				and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
	-- 		end
	--
	-- 		-- Custom formatting function
	-- 		local function custom_format(entry, vim_item)
	-- 			-- Use lspkind to get the pictograms
	-- 			vim_item = lspkind.cmp_format({
	-- 				maxwidth = 50,
	-- 				ellipsis_char = "...",
	-- 			})(entry, vim_item)
	--
	-- 			-- Use tailwindcss_colorizer_cmp to add color previews
	-- 			vim_item = tailwindcss_colorizer_cmp.formatter(entry, vim_item)
	--
	-- 			return vim_item
	-- 		end
	--
	-- 		-- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
	-- 		require("luasnip.loaders.from_vscode").lazy_load()
	-- 		cmp.setup({
	-- 			completion = {
	-- 				completeopt = "menu,menuone,preview,noselect",
	-- 			},
	-- 			snippet = { -- configure how nvim-cmp interacts with snippet engine
	-- 				expand = function(args)
	-- 					luasnip.lsp_expand(args.body)
	-- 				end,
	-- 			},
	-- 			mapping = cmp.mapping.preset.insert({
	-- 				["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
	-- 				["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
	-- 				["<C-b>"] = cmp.mapping.scroll_docs(-4),
	-- 				["<C-f>"] = cmp.mapping.scroll_docs(4),
	-- 				["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
	-- 				["<C-e>"] = cmp.mapping.abort(), -- close completion window
	-- 				["<CR>"] = cmp.mapping.confirm({ select = false }),
	-- 				["<Tab>"] = cmp.mapping(function(fallback)
	-- 					if cmp.visible() then
	-- 						cmp.select_next_item()
	-- 						-- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
	-- 						-- that way you will only jump inside the snippet region
	-- 					elseif luasnip.expand_or_jumpable() then
	-- 						luasnip.expand_or_jump()
	-- 					elseif has_words_before() then
	-- 						cmp.complete()
	-- 					else
	-- 						fallback()
	-- 					end
	-- 				end, { "i", "s" }),
	--
	-- 				["<S-Tab>"] = cmp.mapping(function(fallback)
	-- 					if cmp.visible() then
	-- 						cmp.select_prev_item()
	-- 					elseif luasnip.jumpable(-1) then
	-- 						luasnip.jump(-1)
	-- 					else
	-- 						fallback()
	-- 					end
	-- 				end, { "i", "s" }),
	-- 			}),
	-- 			-- sources for autocompletion
	-- 			sources = cmp.config.sources({
	-- 				{ name = "nvim_lsp" },
	-- 				{ name = "luasnip" }, -- snippets
	-- 				{ name = "buffer" }, -- text within current buffer
	-- 				{ name = "path" }, -- file system paths
	-- 			}),
	-- 			-- configure lspkind for vs-code like pictograms in completion menu
	-- 			formatting = {
	-- 				format = custom_format,
	-- 			},
	-- 		})
	-- 	end,
	-- },
	-- {
	-- 	"roobert/tailwindcss-colorizer-cmp.nvim",
	-- 	-- optionally, override the default options:
	-- 	config = function()
	-- 		require("tailwindcss-colorizer-cmp").setup({
	-- 			color_square_width = 2,
	-- 		})
	-- 	end,
	-- },
}
