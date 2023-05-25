require 'lspconfig'.jdtls.setup { cmd = { 'jdtls' } }

function Send_java_commands()
  local filename = vim.fn.expand('%:p')
  local classname = vim.fn.fnamemodify(filename, ':r')
  local parentdir = vim.fn.fnamemodify(vim.fn.expand('%:h'), ':t')

  print(filename, classname, parentdir)
  vim.cmd('SendKeys "java Space ' .. filename .. ' Enter"')
end
local nnoremap = require("palani.keymap").nnoremap
nnoremap("<C-s>", ":lua Send_java_commands()<CR>")
