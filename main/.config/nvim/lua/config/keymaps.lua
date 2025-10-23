-- LSP
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
vim.keymap.set('n', '<leader>f', ":Pick files<CR>")
vim.keymap.set('n', '<leader>e', ":Oil<CR>")
vim.keymap.set('n', '<leader>cd', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>F', ":FzfLua grep_project<CR>")
vim.keymap.set('n', '<leader>d', ":lua MiniDiff.toggle_overlay()<CR>")

-- Window management
vim.keymap.set('n', '<leader>bd', '<cmd>BufferClose<CR>')
vim.keymap.set('n', '<leader>ww', '<C-W>p', { desc = 'Other Window' })
vim.keymap.set('n', '<leader>wd', '<C-W>c', { desc = 'Delete Window' })
vim.keymap.set('n', '<leader>ws', '<C-W>s', { desc = 'Split Window Below' })
vim.keymap.set('n', '<leader>wv', '<C-W>v', { desc = 'Split Window Right' })

vim.keymap.set('n', '<leader>wh', '<C-w>h', { desc = 'Go to Left Window' })
vim.keymap.set('n', '<leader>wj', '<C-w>j', { desc = 'Go to Lower Window' })
vim.keymap.set('n', '<leader>wk', '<C-w>k', { desc = 'Go to Upper Window' })
vim.keymap.set('n', '<leader>wl', '<C-w>l', { desc = 'Go to Right Window' })

-- Buffer navigation
vim.keymap.set('n', '<S-h>', '<cmd>bprevious<CR>', { desc = 'Prev Buffer' })
vim.keymap.set('n', '<S-l>', '<cmd>bnext<CR>', { desc = 'Next Buffer' })
vim.keymap.set('n', '<leader>bb', '<cmd>BufferPrevious<CR>', { desc = 'Go back to the buffer which you came from' })

-- System clipboard
vim.keymap.set('n', '<S-p>', '"+p', { desc = 'Paste from system clipboard after cursor' })
vim.keymap.set('n', '<S-o>', '"+P', { desc = 'Paste from system clipboard before cursor' })

-- Config reload
vim.keymap.set('n', '<leader>r', '<cmd>source $MYVIMRC<CR>', { desc = 'Reload config' })

-- nohl on escape
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Word count for papers
vim.keymap.set('v', '<leader>wc', ':WordCount<CR>', { noremap = true, silent = true })

-- LSP keybinds function
local function set_lsp_keymaps(event)
  local opts = { buffer = event.buf }

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gI', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', 'gy', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', '<leader>rs', function()
    vim.lsp.buf.code_action({
      filter = function(action)
        return action.kind and string.match(action.kind, 'refactor')
      end,
      apply = true
    })
  end, { desc = 'Refactor Signature' })
end

-- Setup LSP keymaps when LSP attaches
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = set_lsp_keymaps
})
