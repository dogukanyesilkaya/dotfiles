require("core.options")
require("core.keymaps")

vim.o.title = true
vim.o.titlestring = "NVIM - %f"

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

require("lazy").setup({
	require("plugins.nvim-tree"),
	require("plugins.colorscheme"),
	require("plugins.lualine"),
	require("plugins.treesitter"),
	require("plugins.telescope"),
	require("plugins.lsp"),
	require("plugins.blink-cmp"),
	require("plugins.gitsigns"),
	require("plugins.misc"),
	require("plugins.comment"),
	require("plugins.harpoon"),
	require("plugins.vim-tmux-navigator"),
	require("plugins.snacks"),
	require("plugins.conform"),
})
