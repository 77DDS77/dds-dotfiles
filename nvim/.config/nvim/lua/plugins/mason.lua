return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
    event = "BufReadPre",
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		mason.setup({})

		mason_lspconfig.setup({
			ensure_installed = {
				"ts_ls",
				"angularls",
				"lua_ls",
				"html",
				"cssls",
			},
			automatic_installation = true,
            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup({})
                end,
                angularls = function()
                    require("lspconfig")["angularls"].setup({
                        filetypes = { "typescript", "html", "typescriptreact", "typescript.tsx", "angular.html" },
                        settings = {
                            angular = {
                                provideAutocomplete = true,
                                validate = true,
                            },
                        },
                        capabilities = require("cmp_nvim_lsp").default_capabilities(
                            vim.lsp.protocol.make_client_capabilities()
                        )
                    })
                end,
            },
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier",
				"stylua",
				"eslint_d",
				"prettierd",
			},
		})
	end,
}
