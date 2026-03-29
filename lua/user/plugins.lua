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
			view_options = {
				show_hidden = true,
				is_always_hidden = function(name, _)
					return true
				end,
			},
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-live-grep-args.nvim" },
		keys = {
			{ "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find files" },
			{
				"<leader>fg",
				":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
				desc = "Find text",
			},
			{ "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Find buffers" },
		},
		config = function()
			local telescope = require("telescope")

			telescope.setup({})
			telescope.load_extension("live_grep_args")
		end,
	},
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			options = {
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
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
		},
		config = function()
			local cmp = require("cmp")

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "path" },
					{ name = "buffer" },
					{ name = "luasnip" },
				}),
			})
		end,
	},
	{
		"akinsho/toggleterm.nvim",
		config = function()
			require("toggleterm").setup({
				size = 15,
				open_mapping = "<leader>tt",
				size = 20,
				open_mapping = "<leader>tt",
				direction = "float",
				float_opts = {
					border = "curved",
					width = 120,
					height = 30,
					winblend = 3,
					highlights = {
						border = "Normal",
						background = "Normal",
					},
				},
			})
		end,
	},
	{
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup()

			vim.keymap.set("n", "<leader>wk", function()
				require("which-key").show({ global = false })
			end, { desc = "Show keymaps" })
		end,
	},
	{
		"rmagatti/auto-session",
		lazy = false,
		config = function()
			require("auto-session").setup({
				log_level = "error",
			})
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		config = function()
			require("gitsigns").setup({
				current_line_blame = true,
			})
		end,
	},
	{ "malewicz1337/oil-git.nvim", dependencies = { "stevearc/oil.nvim" } },
	{
		"keaising/im-select.nvim",
		config = function()
			require("im_select").setup({
				keep_quiet_on_no_binary = true,
			})
		end,
	},
	{
		"y3owk1n/time-machine.nvim",
		version = "*",
		keys = {
			{ "<leader>lh", "<cmd>TimeMachineToggle<CR>", desc = "Toggle time machine" },
		},
		opts = {},
	},
	{
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup()
		end,
	},
	{
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
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		},
	},
})
