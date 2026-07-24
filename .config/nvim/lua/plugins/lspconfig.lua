return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "bashls", "pyright", "clangd" },
			})
		end,
	},
	{
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- Lua setup
            vim.lsp.config('lua_ls', {
                capabilities = capabilities,
                root_dir = function(bufnr, on_dir)
                    local fname = vim.api.nvim_buf_get_name(bufnr)
                    local root = vim.fs.root(fname, {
                        ".luarc.json", ".luarc.jsonc", ".git"
                    })
                    local home = vim.uv.os_homedir()
                    if root == home then
                        -- If editing Neovim config, set the root to the config directory
                        local nvim_config = home .. "/.config/nvim"
                        if fname:sub(1, #nvim_config) == nvim_config then
                            on_dir(nvim_config)
                        else
                            -- Fallback to the file's parent directory if it's not the home dir itself
                            local file_dir = vim.fs.dirname(fname)
                            if file_dir and file_dir ~= home then
                                on_dir(file_dir)
                            end
                        end
                    elseif root then
                        on_dir(root)
                    end
                end,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                    },
                },
            })
            vim.lsp.enable('lua_ls')

            -- Other servers
            local servers = { "bashls", "pyright", "clangd" }
            for _, server in ipairs(servers) do
                vim.lsp.config(server, { capabilities = capabilities })
                vim.lsp.enable(server)
            end

            -- Keymaps
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
        end,
    },
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"nvimtools/none-ls.nvim",
		},
		config = function()
			require("mason-null-ls").setup({
				ensure_installed = { "stylua", "black" },
			})
		end,
	},
}
