-- Устанавливаем лидер-клавишу (пробел)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Сохраняем файл
vim.keymap.set("n", "<leader>w", ":write<CR>", { desc = "Save file" })

-- Буферы
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete buffer" })
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { desc = "Previous buffer" })

-- Удобное перемещение строк (в визуальном режиме)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })
vim.keymap.set("n", "ff", function()
	local file = vim.fn.expand("%")

	vim.cmd("write")
	vim.cmd("%!biome format --stdin-file-path=" .. vim.fn.expand("%"))
end, { desc = "Format" })

--  Закрывает плавающее окно, если оно есть
--  Иначе снимает подсветку поиска
vim.keymap.set("n", "<Esc>", function()
	-- Проверяем, есть ли плавающее окно
	local wins = vim.api.nvim_tabpage_list_wins(0)
	for _, win in ipairs(wins) do
		if vim.api.nvim_win_get_config(win).zindex then
			vim.api.nvim_win_close(win, true)
			return
		end
	end
	-- Если нет плавающего окна - снимаем подсветку поиска
	vim.cmd("nohlsearch")
end, { desc = "Close float or clear highlight" })

-- В терминале: двойной Esc для выхода в normal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.keymap.set("n", "<leader>or", function()
	require("oil").open(vim.fs.root(0, { ".git" }) or vim.loop.cwd())
end, { desc = "Oil root" })

-- Закрыть все файловые буферы, кроме текущего
vim.keymap.set("n", "<leader>bF", function()
	local current = vim.api.nvim_get_current_buf()
	local closed = 0

	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		local name = vim.api.nvim_buf_get_name(buf)
		local listed = vim.api.nvim_buf_get_option(buf, "buflisted")

		-- Закрываем только если:
		-- 1. Это не текущий буфер
		-- 2. У буфера есть имя (файл на диске)
		-- 3. Буфер загружен и числится в списке (listed)
		if buf ~= current and name ~= "" and listed and vim.api.nvim_buf_is_loaded(buf) then
			pcall(vim.api.nvim_buf_delete, buf, { force = false })
			closed = closed + 1
		end
	end

	print("Closed " .. closed .. " file buffers")
end, { desc = "Close all file buffers except current" })

vim.keymap.set("i", "jj", "<C-x><C-o>", { desc = "Trigger completion" })

-- открыть список старых файлов
vim.keymap.set("n", "<leader>fo", function()
	require("telescope.builtin").oldfiles()
end, { desc = "[F]ind [O]ld files" })

-- Скопировать относительный путь
vim.keymap.set("n", "<leader>yr", function()
	local path = vim.fn.expand("%")
	vim.fn.setreg("+", path)
	print("Copied: " .. path)
end, { desc = "Copy relative path" })
