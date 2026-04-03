return {
	"keaising/im-select.nvim",
	config = function()
		require("im_select").setup({
			keep_quiet_on_no_binary = true,
		})
	end,
}
