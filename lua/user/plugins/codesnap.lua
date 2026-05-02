local function is_wsl()
	return os.getenv("WSL_DISTRO_NAME") ~= nil
end

return {
	"mistricky/codesnap.nvim",
	enabled = not is_wsl(),
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
