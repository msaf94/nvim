-- Основные настройки Neovim
local opt = vim.opt

-- Нумерация строк
opt.number = true -- показывать номера строк
opt.relativenumber = true -- относительные номера (удобно для навигации)

-- Отступы (самая частая боль новичков)
opt.tabstop = 4 -- размер табуляции в пробелах
opt.softtabstop = 4 -- количество пробелов при нажатии Tab
opt.shiftwidth = 4 -- размер отступа для команд >> и <<
opt.expandtab = true -- использовать пробелы вместо табуляции
opt.smartindent = true -- умные отступы

-- Поиск
opt.hlsearch = true -- подсветка результатов поиска
opt.incsearch = true -- поиск по мере ввода
opt.ignorecase = true -- игнорировать регистр
opt.smartcase = true -- если в поиске есть заглавные - искать с учётом регистра

-- Внешний вид
opt.termguicolors = true -- 24-битные цвета (красиво)
opt.cursorline = true -- подсветка строки с курсором
opt.signcolumn = "yes" -- всегда показывать колонку для значков
opt.colorcolumn = "80" -- линия на 80 символов

-- Разное полезное
opt.mouse = "a" -- поддержка мыши
opt.clipboard = "unnamedplus" -- системный буфер обмена
opt.swapfile = false -- не создавать swap-файлы
opt.backup = false -- не создавать backup-файлы
opt.undofile = true -- сохранять историю изменений между сессиями
vim.opt.undodir = vim.fn.expand("~/.local/share/nvim/undo")

-- Время ожидания
opt.timeoutlen = 1000 -- время ожидания для лидер-клавиши (мс)
opt.updatetime = 250 -- время обновления (для плагинов)

-- Настройки диагностики
vim.diagnostic.config({
	-- Иконки в колонке
	signs = true,
	-- Подсказка при наведении
	underline = true,
	update_in_insert = false,
	virtual_text = {
		-- Текст ошибки справа от строки (как в VSCode)
		prefix = "●",
		spacing = 4,
	},
	severity_sort = true,
	float = {
		border = "rounded",
		source = true,
		header = "",
		prefix = "",
	},
})

vim.opt.langmap =
	"ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz,Ж;:"
