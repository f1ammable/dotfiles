require "barbar".setup({
  tabpages = true,
  icons = {
    button = '',
    separator_at_end = false,
    separator = { left = ' ', right = ' ' },
    inactive = {
      separator = { left = ' ', right = ' ' },
      button = ''
    },
    filetype = {
      custom_colors = true,
      enabled = true
    }
  },
  maximum_padding = 1,
  insert_at_start = false,
  insert_at_end = true,
  auto_hide = false
})

-- Custom highlighting for barbar
vim.api.nvim_create_autocmd('ColorScheme', {
  callback = vim.schedule_wrap(function()
    -- Get Normal foreground color and tab background colors
    local gruvbox_bg2 = '#504945'
    local gruvbox_fg2 = '#d5c4a1'
    local gruvbox_bg4 = '#7c6f64'
    local gruvbox_fg3 = '#bdae93'
    local gruvbox_fg1 = '#ebdbb2'

    vim.api.nvim_set_hl(0, 'BufferTabpageFill', { fg = nil, bg = nil, ctermbg = nil })
    vim.api.nvim_set_hl(0, 'TabLineFill', { bg = nil, ctermbg = nil })

    -- Use Normal foreground for all buffer text
    vim.api.nvim_set_hl(0, 'BufferCurrent', { fg = gruvbox_fg2, bg = gruvbox_bg2, bold = true, italic = true })
    vim.api.nvim_set_hl(0, 'BufferInactive', { fg = gruvbox_fg3, bg = gruvbox_bg4, bold = true })
    vim.api.nvim_set_hl(0, 'BufferVisible', { fg = gruvbox_fg1, bg = gruvbox_bg4, bold = true })

    -- Use the default barbar separator colors but with transparent/black backgrounds
    vim.api.nvim_set_hl(0, 'BufferCurrentSign', { fg = gruvbox_bg2, bg = nil })
    vim.api.nvim_set_hl(0, 'BufferInactiveSign', { fg = gruvbox_bg4, bg = nil })
    vim.api.nvim_set_hl(0, 'BufferVisibleSign', { fg = gruvbox_bg4, bg = nil })

    -- Icon bg
    vim.api.nvim_set_hl(0, 'BufferCurrentIcon', { fg = gruvbox_fg2, bg = gruvbox_bg2 })
    vim.api.nvim_set_hl(0, 'BufferInactiveIcon', { fg = gruvbox_fg3, bg = gruvbox_bg4 })
    vim.api.nvim_set_hl(0, 'BufferVisibleIcon', { fg = gruvbox_fg1, bg = gruvbox_bg4 })

    -- Modified
    vim.api.nvim_set_hl(0, 'BufferCurrentMod', { fg = gruvbox_fg2, bg = gruvbox_bg2 })
    vim.api.nvim_set_hl(0, 'BufferInactiveMod', { fg = gruvbox_fg3, bg = gruvbox_bg4 })
    vim.api.nvim_set_hl(0, 'BufferVisibleMod', { fg = gruvbox_fg1, bg = gruvbox_bg4 })
  end),
  group = vim.api.nvim_create_augroup('ChangeHighlight', {}),
})
