return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	priority = 1000,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").setup({
			install_dir = vim.fn.stdpath('data') .. '/site',

			ensure_installed = {
				"markdown",
				"markdown_inline",
				"c",
				"cpp",
				"rust",
				"python",
			},
			highlight = {
				enable = false,
				-- Disable treesitter for big files
				disable = function(_, buf)
					local max_filesize = 100 * 1024 -- 100 KB
					local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
					if ok and stats and stats.size > max_filesize then
						return true
					end
					return false
				end,
				additional_vim_regex_highlighting = false,
			},

			indent = {
				enable = true,
			},
			incremental_selection = {
				enable = false,
			},
		})
	end,
}
