vim.g.node_path = vim.fn.system("nvm which current"):gsub("%s+", "")

_G.nvim_start_time = vim.loop.hrtime()

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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

require("core.vim-options")
require("core.autocmd")
require("core.global-keymaps")
require("lazy").setup("plugins")
