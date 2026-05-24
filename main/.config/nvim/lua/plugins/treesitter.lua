local languages = { "lua", "c", "cmake", "cpp", "python" }

local ts = require('nvim-treesitter')
local installed = ts.get_installed()
local missing = vim.tbl_filter(function(lang)
  return not vim.list_contains(installed, lang)
end, languages)

if #missing > 0 then
  ts.install(missing)
end

vim.api.nvim_create_autocmd('FileType', {
  callback = function()
    pcall(vim.treesitter.start)
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
