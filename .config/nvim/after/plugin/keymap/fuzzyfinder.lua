local Remap = require("palani.keymap")
local nnoremap = Remap.nnoremap
require("fzf-lua").setup({
  "telescope",
  winopts = { preview = { default = "bat" } },
  grep = {
    rg_opts =
    "--column --hidden --line-number --no-heading --color=always --smart-case --max-columns=4096 -g '!.git'",
  },
})

nnoremap("<leader>g", "<cmd>lua require('fzf-lua').live_grep_resume({ fzf_opts = {['--layout'] = 'reverse-list'} })<CR>",
  { silent = true })
nnoremap("<leader>f", "<cmd>lua require('fzf-lua').files({ fzf_opts = {['--layout'] = 'reverse-list'} })<CR>",
  { silent = true })
nnoremap("<leader>b", "<cmd>lua require('fzf-lua').buffers({ fzf_opts = {['--layout'] = 'reverse-list'} })<CR>",
  { silent = true })
nnoremap("<leader>d", "<cmd>lua require('fzf-lua').lsp_references({ fzf_opts = {['--layout'] = 'reverse-list'} })<CR>",
  { silent = true })
