return {
	"mistricky/codesnap.nvim",
	tag = "v2.0.0",
	config = function()
		require("codesnap").setup({
			show_line_number = false,
			snapshot_config = {
				watermark = {
					content = "",
				},
				background = "#000000",
				code_config = {
					breadcrumbs = {
						enable = false,
					},
				},
			},
		})
	end,
}
