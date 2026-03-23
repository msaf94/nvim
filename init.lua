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

print('TODO');
print('Переход по ссылке из терминала');
print('Переход к файлу по импорту scss');
print('Список недавно открытых файлов');
print('nvim git подсветка строк');
print('Oil git  подсветка файлов');
print('Показывать полный путь до файла сверху, а не снизу в oil');
print('Быстрое комментирование кода');
print('Форматирование кода');
print('История файла');
print('vim cyrillic');
print('закрытие других буферов кроме текущего');
print('cmd + space должно открывать подсказку');

