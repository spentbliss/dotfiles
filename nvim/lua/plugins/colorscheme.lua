return {
	{
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("cyberdream").setup({
				cache = true,

				extensions = {
					cmp = true,
					telescope = true,

					alpha = false,
					blinkcmp = false,
					dashboard = false,
					dapui = false,
					gitsigns = false,
					grapple = false,
					helpview = false,
					heirline = false,
					hop = false,
					indentblankline = false,
					kubectl = false,
					leap = false,
					markview = false,
					markdown = false,
					mini = false,
					neogit = false,
					noice = false,
					notify = false,
					rainbow_delimiters = false,
					snacks = false,
					trouble = false,
					treesitter = false,
					treesittercontext = false,
					whichkey = false,
				},

				transparent = false,
				italic_comments = false,
				hide_background = false,
				borderless_telescope = false,

			})
			vim.cmd.colorscheme("cyberdream")
		end,
	},
}
