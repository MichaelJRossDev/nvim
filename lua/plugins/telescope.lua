return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.8',
	dependencies = { 'nvim-lua/plenary.nvim' },
	keys = {
		{ "<leader>tf", "<cmd>Telescope find_files<cr>",  desc = "Find Files" },
		{ "<leader>tg", "<cmd>Telescope live_grep<cr>",   desc = "Live Grep" },
		{ "<leader>tb", "<cmd>Telescope buffers<cr>",     desc = "Find Buffers" },
		{ "<leader>th", "<cmd>Telescope help_tags<cr>",   desc = "Help Tags" },
		{ "<leader>tk", "<cmd>Telescope keymaps<cr>",     desc = "Show Keymaps" },
		{ "<leader>ts", "<cmd>Telescope grep_string<cr>", desc = "Search String Under Cursor" },
	}
}
