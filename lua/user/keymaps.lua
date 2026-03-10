-- Устанавливаем лидер-клавишу (пробел)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Сохраняем файл
vim.keymap.set("n", "<leader>w", ":write<CR>", { desc = "Save file" })

-- Выход из режимов
vim.keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode" })
vim.keymap.set("i", "kj", "<ESC>", { desc = "Exit insert mode" })

-- Навигация между окнами (как в VSCode)
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Буферы (вкладки)
vim.keymap.set("n", "<leader>bn", ":enew<CR>", { desc = "New buffer" })
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete buffer" })
vim.keymap.set("n", "<leader>bl", ":buffers<CR>", { desc = "List buffers" })
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { desc = "Previous buffer" })

-- Отмена подсветки поиска по Esc
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR><Esc>", { desc = "Remove search highlight" })

-- Удобное перемещение строк (в визуальном режиме)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- Закрытие плавающего окна по ESC
vim.keymap.set('n', '<Esc>', function()
  local wins = vim.api.nvim_tabpage_list_wins(0)
  for _, win in ipairs(wins) do
    if vim.api.nvim_win_get_config(win).zindex then
      vim.api.nvim_win_close(win, true)
      return
    end
  end
  vim.cmd('nohlsearch')
end, { desc = 'Close float or clear highlight' })

