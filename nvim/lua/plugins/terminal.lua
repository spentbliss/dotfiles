return {
  "akinsho/toggleterm.nvim",
  version = "*",
  cmd = { "ToggleTerm", "TermExec" },
  keys = {
    { "<leader>t", "<cmd>ToggleTerm<CR>", desc = "Toggle terminal" },
    --   {
    --     "<leader>gg",
    --     function()
    --       local Terminal = require("toggleterm.terminal").Terminal
    --       local lazygit = Terminal:new({
    --         cmd = "lazygit",
    --         hidden = true,
    --         direction = "float",
    --         float_opts = {
    --           border = "curved",
    --           winblend = 3,
    --         },
    --       })
    --       lazygit:toggle()
    --     end,
    --     desc = "Open LazyGit"
    --   },
  },
  config = function()
    require("toggleterm").setup({
      direction = "float",
      float_opts = {
        border = "curved",
        winblend = 0,
        width = 120,
        height = 30,
      },
      open_mapping = [[<leader>t]],
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      persist_mode = false,
      dir = "cwd",
    })
  end,
}
