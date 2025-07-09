return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.4",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Find Files" },
    { "<leader>fg", function() require("telescope.builtin").live_grep() end,  desc = "Live Grep" },
    { "<leader>fb", function() require("telescope.builtin").buffers() end,    desc = "Buffers" },
    { "<leader>fh", function() require("telescope.builtin").help_tags() end,  desc = "Help Tags" },
    { "<leader>fr", function() require("telescope.builtin").resume() end,     desc = "Resume" },
  },
  config = function()
    require("telescope").setup({
      defaults = {
        previewer = false,

        layout_strategy = "horizontal",
        layout_config = {
          prompt_position = "bottom",
          horizontal = {
            preview_width = 0,
          },
          width = 0.4,
          height = 0.5,
        },

        sorting_strategy = "descending",

        file_ignore_patterns = { "node_modules", ".git/", "target", "build" },

        sorter = require("telescope.sorters").get_fuzzy_file,
        scroll_strategy = "limit",

        dynamic_preview_title = false,
      },
    })
  end,
}
