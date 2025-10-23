vim.lsp.enable({ "lua_ls", "clangd", "pyright", "cmake", "astro", "ts_ls", "rust_analyzer", "tinymist" })
vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true)
      }
    }
  }
})
