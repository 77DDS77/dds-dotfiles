return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
	},
	enabled = true,
	config = function()
		local lspconfig = require("lspconfig")
		local util = require("lspconfig.util")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		-- Disable inline error messages
		vim.diagnostic.config({
			virtual_text = false,
			float = {
				border = "single",
			},
		})

		-- Add border to floating window
		vim.lsp.handlers["textDocument/signatureHelp"] =
			vim.lsp.with(vim.lsp.handlers.hover, { border = "single", silent = true })
		vim.lsp.handlers["textDocument/hover"] =
			vim.lsp.with(vim.lsp.handlers.hover, { border = "single", silend = true })

		-- Make float window transparent start

		local set_hl_for_floating_window = function()
			vim.api.nvim_set_hl(0, "NormalFloat", {
				link = "Normal",
			})
			vim.api.nvim_set_hl(0, "FloatBorder", {
				bg = "none",
			})
		end

		set_hl_for_floating_window()

		vim.api.nvim_create_autocmd("ColorScheme", {
			pattern = "*",
			desc = "Avoid overwritten by loading color schemes later",
			callback = set_hl_for_floating_window,
		})

		-- Make float window transparent end

		local on_attach = function(client, bufnr)
			-- vim.keymap.set(
			-- 	"n",
			-- 	"<leader>d",
			-- 	vim.diagnostic.open_float,
			-- 	{ buffer = bufnr, desc = "Show diagnostics for line" }
			-- )
		end

		local capabilities = cmp_nvim_lsp.default_capabilities()
		local signs = { Error = "❌", Warn = "", Hint = "󰠠", Info = "" }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- configure typescript server with plugin
		lspconfig["ts_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
            -- root_dir = lspconfig.util.root_pattern("package.json"),
            root_dir = function(fname)
                local ts_ls_util = require("lspconfig.util")
                if ts_ls_util.root_pattern("deno.json", "deno.jsonc")(fname) then
                    return nil
                end
                return ts_ls_util.root_pattern("tsconfig.json", "package.json", ".git")(fname)
            end,
		})

        -- deno_ls fuckery
        local deno_root = require("lspconfig.util").root_pattern("deno.json", "deno.jsonc")(vim.fn.getcwd())
        if deno_root then
            lspconfig["denols"].setup({
                capabilities = capabilities,
                on_attach = on_attach,
                root_dir = function()
                    return deno_root
                end,
            })
        end

		-- configure html server
		lspconfig["html"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure angular server
		lspconfig["angularls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			root_dir = util.root_pattern("angular.json", "package.json"),
		})

		-- configure lua server (with special settings)
		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = { -- custom settings for lua
				Lua = {
					-- make the language server recognize "vim" global
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})

		-- configure css server
		lspconfig["cssls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

        lspconfig["tailwindcss"].setup({
            capabilities = capabilities,
        })
	end,
}
