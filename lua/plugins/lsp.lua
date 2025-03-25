return {
	-- Mason (LSP Installer)
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate", -- Auto-update registry
		config = function()
			require("mason").setup()
		end,
	},

	-- Mason LSPConfig (Bridge between Mason and nvim-lspconfig)
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "neovim/nvim-lspconfig" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "rust_analyzer" }, -- Add your LSPs
				automatic_installation = true,
			})
		end,
	},

	-- nvim-lspconfig (LSP configurations)
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")

			-- Function to set up LSP keybindings
			local function on_attach(_, bufnr)
				local opts = { buffer = bufnr, silent = true }
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
				vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format { async = true } end, opts)
			end

			-- Configure LSP servers
			local servers = {
				lua_ls = {
					settings = {
						Lua = { diagnostics = { globals = { "vim" } } },
					},
				},
				rust_analyzer = {},
			}

			for server, config in pairs(servers) do
				config.on_attach = on_attach
				config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
				lspconfig[server].setup(config)
			end
		end,
		keys = {
			{ "<leader>d", function() vim.diagnostic.open_float() end, desc = "Show diagnostics in floating window" },
		}
	},
}
