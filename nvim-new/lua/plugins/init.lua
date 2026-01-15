vim.pack.add({
	"https://github.com/vague-theme/vague.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/nvim-telescope/telescope.nvim",
	"https://github.com/nvim-telescope/telescope-fzf-native.nvim",
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/hrsh7th/nvim-cmp",
	"https://github.com/hrsh7th/cmp-nvim-lsp",
	"https://github.com/hrsh7th/cmp-buffer",
	"https://github.com/hrsh7th/cmp-path",
	"https://github.com/L3MON4D3/LuaSnip",
	"https://github.com/saadparwaiz1/cmp_luasnip",
	"https://github.com/onsails/lspkind.nvim",
	"https://github.com/stevearc/conform.nvim",
	"https://github.com/windwp/nvim-autopairs",
	"https://github.com/numToStr/Comment.nvim",
})

-- order colorscheme, cmp, lsp, telescope, treesitter
require("plugins.colorscheme")
require("plugins.movement")
require("plugins.completion")
require("plugins.lsp")
require("plugins.telescope")

