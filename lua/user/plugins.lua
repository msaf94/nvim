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
      view_options = { show_hidden = true, is_always_hidden = function(name, _)
      -- Не скрывать node_modules
      return false  -- показывать всё
    end, },
    },
  },
{
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-live-grep-args.nvim" },
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find files" },
    { "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", desc = "Find text" },
    { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Find buffers" },
  },
    config = function()
    local telescope = require("telescope")

    -- first setup telescope
    telescope.setup({
        -- your config
    })

    -- then load the extension
    telescope.load_extension("live_grep_args")
  end
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
  "akinsho/toggleterm.nvim",
  config = function()
    require("toggleterm").setup({
      size = 15,
      open_mapping = "<leader>tt",  -- тоггл
      size = 20,  -- или function(term) return 20 end
      open_mapping = "<leader>tt",  -- основной терминал
      direction = "float",  -- плавающий по умолчанию
      float_opts = {
        border = "curved",  -- границы: "single", "double", "shadow", "curved"
        width = 120,        -- ширина в символах
        height = 30,        -- высота в символах
        winblend = 3,       -- прозрачность (0-100)
        highlights = {
          border = "Normal",
          background = "Normal",
        },
      },
    })
  end
},
{
  "folke/which-key.nvim",
  config = function()
    require("which-key").setup()
    
    -- Показать все маппинги
    vim.keymap.set("n", "<leader>wk", function()
      require("which-key").show({ global = false })
    end, { desc = "Show keymaps" })
  end
},{
  "rmagatti/auto-session",
  lazy = false, -- Важно! Плагин должен загружаться сразу
  config = function()
    -- Настройка плагина
    require("auto-session").setup({
      -- suppress_dirs = { "~/", "~/Downloads", "/" }, -- Можно исключить папки, где не нужно сохранять сессию
      log_level = "error", -- Уровень логирования (чтобы не засорять вывод)
    })
  end,
}
})
