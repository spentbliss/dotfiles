return {
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        keymaps = {
          normal_add = "sa",
          normal_delete = "sd",
          normal_replace = "sr",
          visual = "sa",
          insert = false,
        },
      })
    end,
  },
}
