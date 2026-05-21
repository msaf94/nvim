vim.env.PATH = vim.env.PATH .. ":/Users/msaf/.opencode/bin"

require("user.options")
require("user.keymaps")
require("user.plugins")
require("user.lsp")
require("user.snippets")

vim.cmd("colorscheme tokyonight")

vim.api.nvim_create_autocmd("CmdlineEnter", {
	callback = function()
		vim.cmd("redrawstatus")
	end,
})

-- print("TODO")
