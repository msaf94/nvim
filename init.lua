-- Главный конфигурационный файrequire("user.options")
require("user.options")
require("user.keymaps")
require("user.plugins")
require("user.lsp")

vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true


require("oil").setup()
require("bufferline").setup{}

vim.api.nvim_create_autocmd('CmdlineEnter', {
  callback = function()
    vim.cmd('redrawstatus')
  end,
})
