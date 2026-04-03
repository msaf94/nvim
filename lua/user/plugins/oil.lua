return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	cmd = { "Oil" },
	keys = {
		{ "<leader>e", ":Oil<CR>", desc = "Open file explorer" },
		{ "-", ":Oil<CR>", desc = "Open parent directory" },
	},
	opts = {
		default_file_explorer = true,
		view_options = {
			show_hidden = true,
			is_always_hidden = function(name, _)
				return true
			end,
		},
	},
}
