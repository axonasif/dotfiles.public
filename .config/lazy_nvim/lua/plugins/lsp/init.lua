-- -- debug
-- vim.lsp.set_log_level("debug")
-- require("vim.lsp.log").set_format_func(vim.inspect)

return {
  -- require("plugins.lsp.inlay_hints"),
  require("plugins.lsp.lspconfig_begin"),
  require("plugins.lsp.rust"),
  require("plugins.lsp.bash"),
  require("plugins.lsp.golang"),
  require("plugins.lsp.docker"),
  require("plugins.lsp.python"),
  -- BEGIN
  -- BEGIN
  -- -- END
  -- require("plugins.lsp.lspconfig_end"),
  -- END
}
