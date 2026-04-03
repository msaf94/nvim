return {
	"folke/which-key.nvim",
	config = function()
		require("which-key").setup()

		vim.keymap.set("n", "<leader>wk", function()
			require("which-key").show({ global = false })
		end, { desc = "Show keymaps" })
	end,
}
