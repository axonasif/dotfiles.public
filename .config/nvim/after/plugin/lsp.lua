local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  local options = { buffer = bufnr, remap = false }
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, options)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, options)
  vim.keymap.set('n', '<leader>vws', vim.lsp.buf.workspace_symbol, options)
  vim.keymap.set('n', '<leader>vd', vim.diagnostic.open_float, options)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_next, options)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_prev, options)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, options)
  vim.keymap.set('n', '<leader>vrr', vim.lsp.buf.references, options)
  vim.keymap.set('n', '<leader>vrn', vim.lsp.buf.rename, options)

  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, options)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, options)
  vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, options)
  vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, options)
  vim.keymap.set({ 'n', 'x' }, '<leader>i', function()
    vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
  end)
end)

lsp_zero.set_preferences({
  file_ignore_patterns = { "*.d.ts" },
  suggest_lsp_servers = true,
  sign_icons = {
    error = 'E',
    warn = 'W',
    hint = 'H',
    info = 'I'
  }
})

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {'tsserver', 'rust_analyzer'},
  handlers = {
    lsp_zero.default_setup,
    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(lua_opts)
    end,
  }
})

local cmp = require('cmp')
local luasnip = require 'luasnip'

cmp.setup({
  sources = {
    {name = 'path'},
    {name = 'nvim_lsp'},
    {name = 'nvim_lua'},
  },
  formatting = lsp_zero.cmp_format(),
  mapping = cmp.mapping.preset.insert({
  ['<C-p>'] = cmp.mapping.select_prev_item(),
  ['<C-n>'] = function(fallback)
    if cmp.visible() then
      cmp.select_next_item()
    elseif luasnip.expand_or_jumpable() then
      luasnip.expand_or_jump()
    else
      fallback()
    end
  end,
  ['<CR>'] = cmp.mapping.confirm {
    behavior = cmp.ConfirmBehavior.Replace,
    select = true,
  },
  ["<C-space>"] = cmp.mapping.complete(),
  ['<Tab>'] = cmp.config.disable,
  }),
})

require('luasnip.loaders.from_vscode').lazy_load()

local nnoremap = require("palani.keymap").nnoremap
nnoremap("<C-c>", "<cmd>lua require('luasnip').jump(1)<CR>")
