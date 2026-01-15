require("conform").setup({
	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},

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
})
require("Comment").setup()
require("nvim-autopairs").setup()
