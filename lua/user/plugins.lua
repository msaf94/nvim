local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Только oil.nvim
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = { "Oil" },
    keys = {
      { "<leader>e", ":Oil<CR>", desc = "Open file explorer" },
      { "-", ":Oil<CR>", desc = "Open parent directory" },
    },
    opts = {
      default_file_explorer = true,
      view_options = { show_hidden = true },
    },
  },
{
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find files" },
    { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Find text" },
    { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Find buffers" },
  },
},
{
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      -- ВКЛЮЧАЕМ ИНДИКАТОРЫ ДИАГНОСТИКИ
      diagnostics = "nvim_lsp",
      diagnostics_indicator = function(count, level, diagnostics_dict, context)
        local s = " "
        for e, n in pairs(diagnostics_dict) do
          local symbol = e == "error" and " " or (e == "warning" and " " or " ")
          s = s .. n .. symbol
        end
        return s
      end,
      always_show_bufferline = true,
      show_buffer_icons = true,
      show_buffer_close_icons = true,
      show_close_icon = true,
    },
  },
},
{"shortcuts/no-neck-pain.nvim", version = "*", opts = {
    width = 120,  -- твоя любимая ширина
    autocmds = {
      enableOnVimEnter = true,
skipEnteringNoNeckPainBuffer = true
    },
  diagnostics = "nvim_lsp"},
},
{
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",     -- LSP подсказки
    "hrsh7th/cmp-buffer",        -- подсказки из буфера
    "hrsh7th/cmp-path",          -- подсказки путей
    "hrsh7th/cmp-cmdline",       -- подсказки в командной строке
    "L3MON4D3/LuaSnip",          -- сниппеты
    "saadparwaiz1/cmp_luasnip",  -- сниппеты для cmp
  },
  config = function()
    local cmp = require('cmp')
    
    cmp.setup({
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end, { 'i', 's' }),
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },      -- LSP
        { name = 'path' },          -- пути к файлам
        { name = 'buffer' },        -- текст из буфера
        { name = 'luasnip' },       -- сниппеты
      }),
    })
    
    -- Для импортов особенно важен path и LSP
  end,
},
{
  "stevearc/conform.nvim",
  opts = {
    -- Определяем, какой форматтер для каких типов файлов использовать
    formatters_by_ft = {
      -- Biome для всех твоих файлов
      javascript = { "biome" },
      javascriptreact = { "biome" },
      typescript = { "biome" },
      typescriptreact = { "biome" },
      json = { "biome" },
      jsonc = { "biome" },
      css = { "biome" },
      html = { "biome" },
    },
    -- Опции для format_on_save (если хочешь автоформат при сохранении)
    format_on_save = {
      -- Время ожидания форматирования в мс
      timeout_ms = 500,
      -- Если форматтер не найден, пробуем LSP
      lsp_format = "fallback",
    },
  },
  -- Добавляем удобную команду для ручного форматирования
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({ async = true })
      end,
      desc = "Format with conform",
    },
  },
}
})
