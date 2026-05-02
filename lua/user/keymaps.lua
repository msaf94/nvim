vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Следующий буфер
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { desc = "Next buffer" })

-- Предыдущий буфер
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { desc = "Previous buffer" })

-- Переместить выделенные строки вниз
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })

-- Переместить выделенные строки вверх
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- Закрыть плавающее окно или убрать подсветку поиска
vim.keymap.set("n", "<Esc>", function()
	local wins = vim.api.nvim_tabpage_list_wins(0)
	for _, win in ipairs(wins) do
		if vim.api.nvim_win_get_config(win).zindex then
			vim.api.nvim_win_close(win, true)
			return
		end
	end
	vim.cmd("nohlsearch")
end, { desc = "Close float or clear highlight" })

-- Выйти из режима терминала
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Открыть Oil в корне проекта
vim.keymap.set("n", "<leader>or", function()
	require("oil").open(vim.fs.root(0, { ".git" }) or vim.loop.cwd())
end, { desc = "Oil root" })

-- Вызов автодополнения в режиме вставки
vim.keymap.set("i", "jj", "<C-x><C-o>", { desc = "Trigger completion" })

-- Найти недавно открытые файлы
vim.keymap.set("n", "<leader>fo", function()
	require("telescope.builtin").oldfiles()
end, { desc = "[F]ind [O]ld files" })

-- Скопировать путь относительно проекта
vim.keymap.set("n", "<leader>yr", function()
	local path = vim.fn.expand("%")
	vim.fn.setreg("+", path)
	print("Copied: " .. path)
end, { desc = "Copy relative path" })

-- Продолжить последний поиск Telescope
vim.keymap.set("n", "<leader>fr", "<cmd>Telescope resume<CR>", { desc = "Resume last picker" })

-- Перейти к контексту treesitter (область/функция)
vim.keymap.set("n", "[c", function()
	require("treesitter-context").go_to_context(vim.v.count1)
end, { silent = true })

-- Прокрутить экран на 3 строки вверх
vim.keymap.set("n", "<C-k>", "3<C-y>", { desc = "Scroll up 3 lines" })

-- Прокрутить экран на 3 строки вниз
vim.keymap.set("n", "<C-j>", "3<C-e>", { desc = "Scroll down 3 lines" })

-- Показать документацию LSP (hover)
vim.keymap.set("n", "K", function()
	vim.lsp.buf.hover({ border = "rounded" })
end)

-- Закрыть буферы слева (с меньшим номером)
vim.keymap.set("n", "<leader>bh", function()
	local current = vim.api.nvim_get_current_buf()
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if buf < current and vim.bo[buf].buflisted then
			require("snacks").bufdelete({ buf = buf, force = false })
		end
	end
end, { desc = "Delete buffers to the left" })

-- Закрыть буферы справа (с большим номером)
vim.keymap.set("n", "<leader>bl", function()
	local current = vim.api.nvim_get_current_buf()
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if buf > current and vim.bo[buf].buflisted then
			require("snacks").bufdelete({ buf = buf, force = false })
		end
	end
end, { desc = "Delete buffers to the right" })

-- Закрыть текущий буфер
vim.keymap.set("n", "<leader>bd", function()
	require("snacks").bufdelete.delete()
end, { desc = "Delete buffer (current)" })

-- Создать новый буфер
vim.keymap.set("n", "<leader>bn", "<cmd>enew<CR>", { desc = "Create new buffer" })

-- Закрыть все буферы кроме текущего
vim.keymap.set("n", "<leader>bF", function()
	require("snacks").bufdelete.other()
end, { desc = "Delete all other buffers" })
