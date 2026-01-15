-- Add border for cmp & more
vim.opt.winborder = "rounded"

-- Remove annoying startup message
vim.opt.shortmess:append("I")

-- Remove tildas on the left of line number
vim.opt.fillchars:append("eob: ")

-- Yank text to system clipboard
vim.opt.clipboard = "unnamedplus"

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.autoindent = true

-- Completion
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.pumheight = 10

-- Vroom
vim.opt.updatetime = 100
vim.opt.timeoutlen = 300
vim.opt.undofile = false
vim.opt.swapfile = false

-- Highlighting stuff
vim.api.nvim_create_autocmd("CmdlineEnter", {
	pattern = "/,?",
	callback = function()
		vim.o.hlsearch = true
	end,
})
vim.api.nvim_create_autocmd("CmdlineLeave", {
	pattern = "/,?",
	callback = function()
		vim.schedule(function()
			vim.o.hlsearch = false
		end)
	end,
})
