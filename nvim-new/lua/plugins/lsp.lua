require("mason").setup()

vim.lsp.enable({
	"pyright",
	"rust_analyzer",
	"clangd",
})

