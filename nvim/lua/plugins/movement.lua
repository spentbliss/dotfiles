return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "black" },
				rust = { "rustfmt" },
				c = { "clang_format" },
				cpp = { "clang_format" },
				html = { "prettier" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				markdown = { "prettier" },
				json = { "prettier" },
				["*"] = { "trim_whitespace" },
			},
			format_on_save = {
				timeout_ms = 300,
				lsp_fallback = false,
			},
		},
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {
			fast_wrap = false, -- Disable heavy feature
			disable_filetype = { "TelescopePrompt", "vim" }, -- Avoid conflicts
		},
		config = function(_, opts)
			local autopairs = require("nvim-autopairs")
			autopairs.setup(opts)
			-- Cmp integration
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},
	{
		"numToStr/Comment.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
	},
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "-" },
			},
			update_debounce = 200, -- Delay updates to reduce lag
			numhl = false,
		},
	},
}
