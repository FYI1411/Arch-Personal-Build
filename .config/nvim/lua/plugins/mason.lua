return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {"lua_ls", "bashls", "pyright", "clangd" }
			})
		end
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
			  settings = {
				Lua = {
					diagnostics = {
						globals = {'vim'},
					},
				}
			  }
			})
			lspconfig.bashls.setup({})
			lspconfig.pyright.setup({})
			lspconfig.clangd.setup({})
		end
	},
}
