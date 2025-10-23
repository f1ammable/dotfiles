require "blink.cmp".setup({
  keymap = { preset = 'enter' },
  sources = { default = { 'lsp', 'path', 'snippets' } },
  fuzzy = {
    implementation = "prefer_rust_with_warning",
    prebuilt_binaries = { download = true, force_version = 'v1.6.0' }
  }
})
