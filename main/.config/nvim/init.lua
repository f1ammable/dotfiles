require("config.options")
require("config.keymaps")
require("config.plugins")

-- Spellcheck for typst
vim.api.nvim_create_autocmd('FileType', {
  pattern = { "typst", "markdown" },
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = "en_gb"
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.breakindent = true
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
  end,
})

-- Word counter
vim.api.nvim_create_user_command('WordCount', function()
  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")

  local lines = vim.fn.getline(start_pos[2], end_pos[2])

  if (type(lines) == "string") then
    lines = { lines }
  end

  if #lines == 1 then
    lines[1] = string.sub(lines[1], start_pos[3], end_pos[3])
  else
    lines[1] = string.sub(lines[1], start_pos[3])
    lines[#lines] = string.sub(lines[#lines], 1, end_pos[3])
  end

  local text = table.concat(lines, ' ')
  local word_count = 0
  for _ in text:gmatch("%S+") do
    word_count = word_count + 1
  end

  print(string.format("Words: %d", word_count))
end, { range = true })

vim.cmd("colorscheme gruvbox")
