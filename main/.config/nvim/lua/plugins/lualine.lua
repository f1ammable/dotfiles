require('lualine').setup {
  options = {
    theme = require("lualine-theme").theme(),
    component_separators = ' ',
    -- section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = { { 'mode', separator = { left = ' ', right = '' } } },
    lualine_b = { {
      function() return ' ' end,
      color = 'LualineInvisible',
      separator = '',
      left_padding = 0,
      right_padding = 0
    }, { 'filename', separator = { left = '', right = '' } }, { 'branch', separator = { left = '', right = '' } }, { 'diff', separator = { right = '' } } },
    lualine_c = {},
    lualine_x = {},
    lualine_y = { { 'filetype', separator = { left = '' } }, { 'progress', separator = { right = '' } }, { function() return
      ' ' end,
      color = 'LualineInvisible',
      left_padding = 0,
      right_padding = 0 } },
    lualine_z = {
      { 'location', separator = { left = '', right = ' ' } },
    },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
      {
        function()
          if #vim.api.nvim_list_wins() > 1 then
            return string.rep('─', vim.o.columns) -- Full width solid line
          end
          return ''
        end,
        separator = '',
        padding = 0,
      }
    },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {},
  globalstatus = true
}

-- Custom highlighting for lualine
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.api.nvim_set_hl(0, "StatusLine", { fg = '#555555', bg = "NONE" })
    vim.api.nvim_set_hl(0, "StatusLineNC", { fg = '#555555', bg = "NONE" })
    vim.api.nvim_set_hl(0, 'LualineInvisible', { fg = 'NONE', bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'VertSplit', { fg = '#555555', bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'WinSeparator', { fg = '#555555', bg = 'NONE' })
  end,
})
