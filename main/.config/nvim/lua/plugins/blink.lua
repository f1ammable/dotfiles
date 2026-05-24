require "blink.cmp".setup({
  keymap = { preset = 'enter' },
  sources = { default = { 'lsp', 'path', 'snippets' } },
  fuzzy = {
    implementation = "prefer_rust_with_warning",
  }
})
