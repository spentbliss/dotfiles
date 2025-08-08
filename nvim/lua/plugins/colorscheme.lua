return {
	{
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd("colorscheme cyberdream")
		end,
	},
	{
		"spentbliss/alabaster",
		lazy = true,
		-- priority = 1000,
		-- config = function()
		-- 	vim.cmd("colorscheme alabaster")
		-- end,
	},
	{
		"theamallalgi/zitchdog",
		-- 	lazy = true,
		-- 	priority = 1000,
		-- 	config = function()
		-- 		require("zitchdog").setup({
		-- 			transparent_bg = true,
		-- 			variant = "grape",
		-- 			italic_comments = false,
		-- 		})
		-- 		require("zitchdog").load({ variant = "grape" })
		-- 	end,
	},
}
