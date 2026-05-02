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
	{ "folke/tokyonight.nvim" },
	require("user.plugins.toggleterm"),
	require("user.plugins.oil"),
	require("user.plugins.telescope"),
	require("user.plugins.bufferline"),
	require("user.plugins.nvim-cmp"),
	require("user.plugins.which-key"),
	require("user.plugins.auto-session"),
	require("user.plugins.git-signs"),
	require("user.plugins.oil-git"),
	require("user.plugins.im-select"),
	require("user.plugins.time-machine"),
	require("user.plugins.nvim-surround"),
	require("user.plugins.conform"),
	-- require("user.plugins.nvim-eslint"),
	require("user.plugins.nvim-treesitter"),
	require("user.plugins.nvim-treesitter-context"),
	require("user.plugins.codesnap"),
	require("user.plugins.snacks"),
	require("user.plugins.opencode"),
})
