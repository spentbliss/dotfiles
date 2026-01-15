local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup({
  defaults = {
    prompt_prefix = '> ',
    selection_caret = '* ',
    sorting_strategy = 'descending',
	layout_strategy = 'horizontal',
    layout_config = {
      horizontal = {
        prompt_position = 'bottom',
        preview_width = 0,
      },
      width = 0.4,
      height = 0.5,
    },
    file_ignore_patterns = {
      'node_modules',
      '.git/',
      'dist/',
      'build',
	  'target',
    },
    mappings = {
      i = {
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
        ['<C-q>'] = actions.send_to_qflist + actions.open_qflist,
        ['<Esc>'] = actions.close,
      },
      n = {
        ['q'] = actions.close,
        ['<C-q>'] = actions.send_to_qflist + actions.open_qflist,
      },
    },
  },
  pickers = {
    find_files = {
      hidden = true,
    },
    buffers = {
      initial_mode = 'normal',
    },
  },
})

pcall(telescope.load_extension, 'fzf')

-- Keymaps
vim.keymap.set('n', '<leader><leader>', '<cmd>Telescope find_files<cr>', { desc = 'Find files' })
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { desc = 'Live grep' })
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { desc = 'Buffers' })
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', { desc = 'Help tags' })
vim.keymap.set('n', '<leader>fr', '<cmd>Telescope oldfiles<cr>', { desc = 'Recent files' })
vim.keymap.set('n', '<leader>fc', '<cmd>Telescope grep_string<cr>', { desc = 'Find string under cursor' })

-- Git keymaps
vim.keymap.set('n', '<leader>gf', '<cmd>Telescope git_files<cr>', { desc = 'Git files' })
vim.keymap.set('n', '<leader>gc', '<cmd>Telescope git_commits<cr>', { desc = 'Git commits' })
vim.keymap.set('n', '<leader>gb', '<cmd>Telescope git_branches<cr>', { desc = 'Git branches' })
vim.keymap.set('n', '<leader>gs', '<cmd>Telescope git_status<cr>', { desc = 'Git status' })

-- LSP keymaps
vim.keymap.set('n', '<leader>ld', '<cmd>Telescope lsp_definitions<cr>', { desc = 'LSP definitions' })
vim.keymap.set('n', '<leader>lr', '<cmd>Telescope lsp_references<cr>', { desc = 'LSP references' })
vim.keymap.set('n', '<leader>li', '<cmd>Telescope lsp_implementations<cr>', { desc = 'LSP implementations' })
vim.keymap.set('n', '<leader>ls', '<cmd>Telescope lsp_document_symbols<cr>', { desc = 'Document symbols' })


vim.keymap.set('n', '<leader>fd', '<cmd>Telescope diagnostics<cr>', { desc = 'Diagnostics' })
vim.keymap.set('n', '<leader>fk', '<cmd>Telescope keymaps<cr>', { desc = 'Keymaps' })
vim.keymap.set('n', '<leader>/', '<cmd>Telescope current_buffer_fuzzy_find<cr>', { desc = 'Fuzzy find in buffer' })
