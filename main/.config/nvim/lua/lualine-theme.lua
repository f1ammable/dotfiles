local M = {}
M.theme = function()
  local colors = {
    black        = '#282828',
    white        = '#ebdbb2',
    red          = '#fb4934',
    green        = '#b8bb26',
    blue         = '#83a598',
    yellow       = '#fe8019',
    gray         = '#a89984',
    darkgray     = '#3c3836',
    lightgray    = '#504945',
    inactivegray = '#7c6f64',
  }
  return {
    inactive = {
      a = { fg = colors.gray, bg = 'none'},
      b = { fg = colors.darkgray, bg = 'none' },
      c = { fg = colors.gray, bg = 'none' },
      x = { fg = colors.darkgray, bg = 'none' },
      y = { fg = colors.gray, bg = 'none' },
      z = { fg = colors.gray, bg = 'none'  },
    },
    visual = {
      a = { fg = colors.black, bg = colors.yellow, gui = "bold" },
      b = { fg = colors.white, bg = colors.lightgray },
      c = { fg = colors.gray},
      x = { fg = colors.gray },
      y = { fg = colors.white, bg = colors.lightgray },
      z = { fg = colors.black, bg = colors.yellow, gui = "bold" },
    },
    replace = {
      a = { fg = colors.black, bg = colors.red, gui = "bold" },
      b = { fg = colors.white, bg = colors.lightgray },
      c = { fg = colors.gray},
      x = { fg = colors.gray },
      y = { fg = colors.white, bg = colors.lightgray },
      z = { fg = colors.black, bg = colors.red, gui = "bold" },
    },
    normal = {
      a = { fg = colors.black, bg = colors.gray, gui = "bold" },
      b = { fg = colors.white, bg = colors.lightgray },
      c = { fg = colors.gray},
      x = { fg = colors.gray },
      y = { fg = colors.white, bg = colors.lightgray },
      z = { fg = colors.black, bg = colors.gray, gui = "bold" },
    },
    insert = {
      a = { fg = colors.black, bg = colors.blue, gui = "bold" },
      b = { fg = colors.white, bg = colors.lightgray },
      c = { fg = colors.gray},
      x = { fg = colors.gray },
      y = { fg = colors.white, bg = colors.lightgray },
      z = { fg = colors.black, bg = colors.blue, gui = "bold" },
    },
    command = {
      a = { fg = colors.black, bg = colors.green, gui = "bold" },
      b = { fg = colors.white, bg = colors.lightgray },
      c = { fg = colors.gray},
      x = { fg = colors.gray },
      y = { fg = colors.white, bg = colors.lightgray },
      z = { fg = colors.black, bg = colors.green, gui = "bold" },
    },
  }
end
return M
