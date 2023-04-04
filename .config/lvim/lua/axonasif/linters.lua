-- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "write-good",   filetypes = { "markdown" } },
  { command = "flake8",       filetypes = { "python" } },
  { command = "markdownlint", filetypes = { "markdown" } },
}
