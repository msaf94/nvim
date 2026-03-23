-- Устанавливаем лидер-клавишу (пробел)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Сохраняем файл
vim.keymap.set("n", "<leader>w", ":write<CR>", { desc = "Save file" })

-- Буферы
vim.keymap.set("n", "<leader>bn", ":enew<CR>", { desc = "New buffer" })
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete buffer" })
vim.keymap.set("n", "<leader>bl", ":buffers<CR>", { desc = "List buffers" })
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { desc = "Previous buffer" })

-- Удобное перемещение строк (в визуальном режиме)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

--  Закрывает плавающее окно, если оно есть
--  Иначе снимает подсветку поиска
vim.keymap.set('n', '<Esc>', function()
  -- Проверяем, есть ли плавающее окно
  local wins = vim.api.nvim_tabpage_list_wins(0)
  for _, win in ipairs(wins) do
    if vim.api.nvim_win_get_config(win).zindex then
      vim.api.nvim_win_close(win, true)
      return
    end
  end
  -- Если нет плавающего окна - снимаем подсветку поиска
  vim.cmd('nohlsearch')
end, { desc = 'Close float or clear highlight' })

-- В терминале: двойной Esc для выхода в normal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

