local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "autopep8",  filetypes = { "python" } },
  { command = "goimports", filetypes = { "go" } },
  { command = "gofumpt",   filetypes = { "go" } },
}
