return {
	"folke/snacks.nvim",
	priority = 1000, -- Загружается раньше, чтобы быть готовым к работе сразу
	lazy = false, -- Отключаем ленивую загрузку для мгновенного доступа
	opts = {
		input = { enabled = true },
		picker = { enabled = true },
		bigfile = { enabled = true },
		dashboard = { enabled = false },
		indent = { enabled = true },
		notifier = { enabled = false },
		quickfile = { enabled = true },
		statuscolumn = { enabled = false },
		words = { enabled = true },
		bufdelete = { enabled = true },
	},
}
