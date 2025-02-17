vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
	local repo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath })
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require("configs.lazy")

-- load plugins
require("lazy").setup({
	{
		"NvChad/NvChad",
		lazy = false,
		branch = "v2.5",
		import = "nvchad.plugins",
	},

	{ import = "plugins" },
}, lazy_config)

for _, v in ipairs(vim.fn.readdir(vim.g.base46_cache)) do
	dofile(vim.g.base46_cache .. v)
end
require("options")
require("nvchad.autocmds")

vim.schedule(function()
	require("mappings")
end)

-- Enable folding by syntax
local vim = vim
local opt = vim.opt

opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
-- Customize fold level (higher means more unfolded sections)
vim.o.foldlevel = 0
-- Define custom fold text
vim.opt.foldtext = "v:lua.CustomFoldText()"
-- Custom fold text function
function _G.CustomFoldText()
	local line = vim.fn.getline(vim.v.foldstart) -- Get the first line of the fold
	local fold_header = "▶ " .. line -- Add a custom icon (optional) to the fold header
	return fold_header
end

-- Highlight the fold text
vim.cmd([[
  hi Folded guifg=#ff9e64 guibg=#1e222a
]])

vim.api.nvim_set_keymap("n", "<C-m>", ":bnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-p>", ":bprevious<CR>", { noremap = true, silent = true })

vim.cmd([[
     highlight LineNr guifg=#808080
    highlight CursorLineNr guifg=#FF8C00
    highlight CursorColumn guibg=#202020
 ]])

vim.cmd("highlight Visual guibg=#0B243C guifg=NONE")
