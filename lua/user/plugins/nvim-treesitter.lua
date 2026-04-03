return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").install({
			"typescript",
			"javascript",
			"json",
			"css",
			"scss",
			"html",
			"lua",
		})

		require("nvim-treesitter.config").setup({
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
