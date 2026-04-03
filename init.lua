require("user.options")
require("user.keymaps")
require("user.plugins")
require("user.lsp")

require("oil").setup()
require("bufferline").setup({})

vim.api.nvim_create_autocmd("CmdlineEnter", {
	callback = function()
		vim.cmd("redrawstatus")
	end,
})

-- print("TODO")
