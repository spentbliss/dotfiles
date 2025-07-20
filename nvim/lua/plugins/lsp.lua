return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "hrsh7th/cmp-nvim-lsp" },

		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			vim.diagnostic.config({
				-- virtual_text = {
				-- 	prefix = "● ",
				-- 	spacing = 4,
				-- },
				update_in_insert = true,
				severity_sort = true,
				float = {
					border = "rounded",
					source = "always",
					header = "",
					prefix = "",
				},
			})

			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

			vim.lsp.handlers["textDocument/signatureHelp"] =
				vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

			local on_attach = function(client, bufnr)
				local bufmap = function(mode, lhs, rhs, desc)
					vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc, silent = true })
				end
				bufmap("n", "gd", vim.lsp.buf.definition, "Go to definition")
				bufmap("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
				bufmap("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
				bufmap("n", "gr", vim.lsp.buf.references, "Find references")
				bufmap("n", "K", vim.lsp.buf.hover, "Show hover documentation")
				bufmap("n", "<leader>k", vim.lsp.buf.signature_help, "Show signature help")
				bufmap("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
				bufmap("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
				bufmap("n", "<leader>e", vim.diagnostic.open_float, "Show line diagnostics")
				bufmap("n", "<leader>dl", vim.diagnostic.setloclist, "Diagnostics to location list")
				bufmap("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")
				bufmap("n", "[d", vim.diagnostic.goto_prev, "Previous diagnostic")
				client.server_capabilities.documentFormattingProvider = false
				client.server_capabilities.documentRangeFormattingProvider = false
			end

			local servers = {
				rust_analyzer = {
					settings = {
						["rust-analyzer"] = {
							checkOnSave = { command = "clippy" },
							diagnostics = { experimental = { enable = true } },
						},
					},
				},
				clangd = {
					cmd = { "clangd", "--background-index", "--clang-tidy" },
					init_options = { clangdFileStatus = true },
				},
				lua_ls = {
					settings = {
						Lua = {
							diagnostics = { globals = { "vim" } },
							workspace = { checkThirdParty = false },
							telemetry = { enable = false },
						},
					},
				},
				pyright = {
					settings = {
						python = {
							analysis = {
								autoSearchPaths = true,
								useLibraryCodeForTypes = true,
								diagnosticMode = "openFilesOnly",
							},
						},
					},
				},
				html = {
					filetypes = { "html" },
				},
			}

			for server, opts in pairs(servers) do
				opts.capabilities = capabilities
				opts.on_attach = on_attach
				opts.flags = { debounce_text_changes = 150 }
				lspconfig[server].setup(opts)
			end
		end,
	},
}
