local notify = require("notify")

notify.setup({
  stages = "fade_in_slide_out",
  render = "minimal",
  timeout = 4000,
  background_colour = "FloatShadow",
  minimum_width = 50,
  top_down = false,
  level = 3,
  icons = {
    ERROR = "",
    WARN  = "",
    INFO  = "",
    DEBUG = "",
    TRACE = "✎",
  },
})

vim.notify = notify
