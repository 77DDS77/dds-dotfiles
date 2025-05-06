vim.g.node_path = vim.fn.system("nvm which current"):gsub("%s+", "")

--test 
--

local start = vim.loop.hrtime()
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local elapsed = (vim.loop.hrtime() - start) / 1e6
    print("Avvio completato in " .. math.floor(elapsed) .. " ms")
  end
})


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
