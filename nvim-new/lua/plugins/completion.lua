local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },

  -- Key mappings for completion
  mapping = cmp.mapping.preset.insert({
    -- Navigate completion menu
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),

    -- Scroll documentation window
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),

    -- Trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),

    -- Close completion menu
    ['<C-e>'] = cmp.mapping.abort(),

    -- Confirm selection
    ['<CR>'] = cmp.mapping.confirm({ select = true }),

    -- Tab to select next item or expand snippet
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),

    -- Shift-Tab to select previous item
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),

  -- Completion sources (PATH and BUFFER)
  sources = cmp.config.sources({
	{ name = 'nvim_lsp' },
	{ name = 'luasnip' },
    { name = 'path'  },      -- File path completion
    { name = 'buffer'},       -- Buffer word completion
      option = {
        -- Search all visible buffers
        get_bufnrs = function()
          local bufs = {}
          for _, win in ipairs(vim.api.nvim_list_wins()) do
            bufs[vim.api.nvim_win_get_buf(win)] = true
          end
          return vim.tbl_keys(bufs)
        end
      }
  }),

  -- Formatting for completion menu
  formatting = {
    format = function(entry, vim_item)
      -- Set icons for different sources
      local icons = {
        path = '📁',
        buffer = '📄',
      }
      return vim_item
    end
  },

  -- Experimental features
  experimental = {
    ghost_text = true,  -- Show preview of completion
  },
})
