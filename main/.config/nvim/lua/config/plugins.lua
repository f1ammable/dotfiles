vim.pack.add({
  { src = "https://github.com/ellisonleao/gruvbox.nvim" },
  { src = "https://github.com/stevearc/oil.nvim" },
  { src = "https://github.com/echasnovski/mini.pick" },
  { src = "https://github.com/echasnovski/mini.ai" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/saghen/blink.cmp" },
  { src = "https://github.com/rachartier/tiny-inline-diagnostic.nvim" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },
  { src = "https://github.com/nvim-lualine/lualine.nvim" },
  { src = "https://github.com/romgrk/barbar.nvim" },
  { src = "https://github.com/wakatime/vim-wakatime" },
  { src = "https://github.com/folke/todo-comments.nvim" },
  { src = "https://github.com/ibhagwan/fzf-lua" },
  { src = "https://github.com/nvim-mini/mini.diff" },
  { src = "https://github.com/chomosuke/typst-preview.nvim" }
})

require("plugins.treesitter")
require("plugins.gruvbox")
require("plugins.oil")
require("plugins.mini")
require("plugins.blink")
require("plugins.diagnostics")
require("plugins.devicons")
require("plugins.barbar")
require("plugins.lualine")
require("plugins.lsp")
require("plugins.comments")
require("plugins.fzf")
require("plugins.diff")
require("plugins.typst")
