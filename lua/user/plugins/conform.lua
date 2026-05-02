return {
	"stevearc/conform.nvim",
	opts = {
		-- После переезда на biome
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
				args = { "check", "--diagnostic-level=warn", "--write", "--unsafe", "--stdin-file-path", "$FILENAME" },
			},
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},

		-- До переезда на biome
		-- formatters_by_ft = {
		-- 	javascript = { "eslint_d", "prettier" },
		-- 	typescript = { "eslint_d", "prettier" },
		-- 	javascriptreact = { "eslint_d", "prettier" },
		-- 	typescriptreact = { "eslint_d", "prettier" },
		-- 	lua = { "stylua" },
		-- },
		-- formatters = {
		-- 	eslint_d = {
		-- 		args = { "$FILENAME", "--fix" },
		-- 	},
		-- },
		-- format_on_save = {
		-- 	timeout_ms = 2000,
		-- 	lsp_format = "fallback",
		-- },
	},
}
