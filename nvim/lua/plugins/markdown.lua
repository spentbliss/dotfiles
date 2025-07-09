return {
  'MeanderingProgrammer/render-markdown.nvim',
  ft = { "markdown" },
  opts = {
    render_modes = true,
    code = {
      sign = false,
      language_name = false,
      width = 'block',
      left_pad = 2,
      right_pad = 2,
    },
    heading = {
      position = 'inline',
      sign = false,
      width = 'block',
      left_pad = 2,
      right_pad = 2,
    },
  },
}
