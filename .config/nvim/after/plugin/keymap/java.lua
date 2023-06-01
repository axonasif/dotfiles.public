require 'lspconfig'.jdtls.setup { cmd = { 'jdtls' } }

function Send_java_commands()
  local filename = vim.fn.expand('%:p')
  local classname = vim.fn.fnamemodify(filename, ':r')
  local parentdir = vim.fn.fnamemodify(vim.fn.expand('%:h'), ':t')

  print(filename, classname, parentdir)
  vim.cmd('SendKeys "java Space ' .. filename .. ' Enter"')
end

function Send_exec_commands()
  local filename = vim.fn.expand('%:p')
  local filetype = vim.bo.filetype
  print(filetype)
  if filetype == "java" then
    vim.cmd('SendKeys "java Space ' .. filename .. ' Enter"')
  elseif filetype == "go" then
    vim.cmd('SendKeys "go Space run Space ' .. filename .. ' Enter"')
  end
end

local nnoremap = require("palani.keymap").nnoremap

-- nnoremap("<C-b>", ":lua Send_java_commands()<CR>")
nnoremap("<C-b>", ":lua Send_exec_commands()<CR>")
