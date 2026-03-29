-- Главный конфигурационный файrequire("user.options")
require("user.options")
require("user.keymaps")
require("user.plugins")
require("user.lsp")

vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true

require("oil").setup()
require("bufferline").setup({})

vim.api.nvim_create_autocmd("CmdlineEnter", {
	callback = function()
		vim.cmd("redrawstatus")
	end,
})

vim.opt.langmap =
	"ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz,Ж;:"

vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.local/share/nvim/undo")

print("TODO")
print("Переход по ссылке из терминала")
print("Форматирование кода")
