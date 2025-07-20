-- Remove annoying startup message
vim.opt.shortmess:append("I")

-- Yank text; goes to clipboard
vim.opt.clipboard = "unnamedplus"

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.fillchars:append("eob: ")

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.smartindent = true

-- Highlighting stuff
vim.api.nvim_create_autocmd("CmdlineLeave", {
	pattern = "/,?",
	callback = function()
		vim.schedule(function()
			vim.o.hlsearch = false
		end)
	end,
})

vim.api.nvim_create_autocmd("CmdlineEnter", {
	pattern = "/,?",
	callback = function()
		vim.o.hlsearch = true
	end,
})
