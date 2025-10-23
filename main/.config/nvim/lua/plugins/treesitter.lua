local function setup_treesitter()
  local languages = { "lua", "c", "cmake", "cpp", "python" }

  require "nvim-treesitter.configs".setup({
    ensure_installed = languages,
    highlight = { enable = true },
    indent = { enable = true }
  })

  local parsers = require "nvim-treesitter.parsers"
  local missing = {}
  for _, lang in ipairs(languages) do
    if not parsers.has_parser(lang) then
      table.insert(missing, lang)
    end
  end

  if #missing > 0 then
    vim.cmd('TSUpdate')
  end
end

vim.defer_fn(setup_treesitter, 100)
