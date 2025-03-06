return {
	'stevearc/oil.nvim',
	opts = {
		win_options = {
			winbar = "%{v:lua.require('oil').get_current_dir()}",
		},
		view_options = {
			show_hidden = true,
		}
	},
	-- Optional dependencies
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
	-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
	lazy = false,
	keys = {
		{ "<leader>e", function() require("oil").open() end, desc = "Open Oil file explorer" },
	}
}
