-- debug
vim.lsp.set_log_level("debug")
require("vim.lsp.log").set_format_func(vim.inspect)

return {
  require("plugins.lsp.rust"),
  require("plugins.lsp.golang"),
  -- require("plugins.lsp.inlay_hints"),
  -- require("plugins.lsp.mason_lspconfig"),
}
