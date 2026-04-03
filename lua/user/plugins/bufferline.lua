return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			diagnostics = "nvim_lsp",
			diagnostics_indicator = function(count, level, diagnostics_dict, context)
				local s = " "
				for e, n in pairs(diagnostics_dict) do
					local symbol = e == "error" and " " or (e == "warning" and " " or " ")
					s = s .. n .. symbol
				end
				return s
			end,
			always_show_bufferline = true,
			show_buffer_icons = true,
			show_buffer_close_icons = true,
			show_close_icon = true,
		},
	},
}
