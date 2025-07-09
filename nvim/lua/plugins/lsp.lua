return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "hrsh7th/cmp-nvim-lsp" },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local on_attach = function(_) end

      local servers = {
        rust_analyzer = {},
        clangd = {},
        lua_ls = {},
        pyright = {},
        html = {},
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
