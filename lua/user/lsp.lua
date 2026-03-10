-- Иконки для диагностики
local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- ✅ Biome — официальная конфигурация
vim.lsp.config('biome', {
  cmd = { 'biome', 'lsp-proxy' },
  filetypes = { 
    'astro', 'css', 'graphql', 'html', 
    'javascript', 'javascriptreact', 
    'json', 'jsonc', 
    'svelte', 'typescript', 'typescriptreact', 
    'vue' 
  },
  root_markers = { 'biome.json', 'biome.jsonc' },
  workspace_required = true,
  on_attach = function(client, bufnr)
    local opts = { buffer = bufnr, silent = true }
    
    -- Форматирование
    vim.keymap.set('n', '<leader>f', function()
      vim.lsp.buf.format({ async = true })
    end, opts)
    
    -- Диагностика
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
  end,
})

vim.lsp.enable('biome')

vim.lsp.config("ts_ls", {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  root_markers = { "package.json", "tsconfig.json", ".git" },
  on_attach = function(client, bufnr)
    local opts = { buffer = bufnr, silent = true }
    
    -- Только самые нужные команды
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)        -- переход к определению
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)        -- найти ссылки
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)    -- переименовать
    
    -- Диагностика (ошибки)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
  end,
})

-- Включаем только TypeScript сервер
vim.lsp.enable({ "ts_ls" })

-- CSS/SCSS/LESS LSP (дополнительно к Biome)
vim.lsp.config('cssls', {
  cmd = { 'vscode-css-language-server', '--stdio' },
  filetypes = { 'css', 'scss', 'less' },
  root_markers = { 'package.json', '.git' },
  on_attach = function(client, bufnr)
    local opts = { buffer = bufnr, silent = true }
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  end,
})
vim.lsp.enable('cssls')

