return {
	"nvim-neorg/neorg",
	dependencies = { "nvim-lua/plenary.nvim" },
	lazy = false,
	ft = "norg",
	opts = {
		load = {
			["core.defaults"] = {},
			["core.dirman"] = {
				config = {
					workspaces = {
						notes = "~/neorg",
					},
					default_workspace = "notes",
				},
			},
			["core.journal"] = {
				config = {
					strategy = "nested", -- or "flat"
					workspace = "notes"
				},
			},
			["core.integrations.treesitter"] = {},
			["core.keybinds"] = {
				config = {
					default_keybinds = true,
				},
			},
			["core.concealer"] = {},
		},
	},
	keys = {
		{ "<leader>jt", "<cmd>Neorg journal today<cr>", "Open today's jorunal entry" },
		{"<leader>jy", "<cmd>Neorg journal yesterday<cr>", "Open yesterday's journal entry"}
	}
}
