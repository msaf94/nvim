return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			javascript = { "biome", "biome-organize-imports" },
			typescript = { "biome", "biome-organize-imports" },
			javascriptreact = { "biome", "biome-organize-imports" },
			typescriptreact = { "biome", "biome-organize-imports" },
			json = { "biome" },
			jsonc = { "biome" },
			lua = { "stylua" },
		},
		formatters = {
			biome = {
				args = { "check", "--write", "--unsafe", "--stdin-file-path", "$FILENAME" },
			},
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
		-- formatters_by_ft = {
		-- 	javascript = { "prettier" },
		-- 	typescript = { "prettier" },
		-- 	javascriptreact = { "prettier" },
		-- 	typescriptreact = { "prettier" },
		-- 	json = { "biome" },
		-- 	jsonc = { "biome" },
		-- 	lua = { "stylua" },
		-- },
		-- format_on_save = {
		-- 	timeout_ms = 500,
		-- 	lsp_format = "fallback",
		-- },
	},
}
