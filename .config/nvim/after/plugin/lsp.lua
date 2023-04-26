local options = { noremap = true, silent = true }
local luasnip = require 'luasnip'
local cmp = require('cmp')
local lsp = require('lsp-zero').preset({
  name = 'minimal',
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
  suggest_lsp_servers = true,
})

local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
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
  ['<Tab>'] = cmp.config.disable
})

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
  suggest_lsp_servers = true,
  sign_icons = {
    error = 'E',
    warn = 'W',
    hint = 'H',
    info = 'I'
  }
})

vim.diagnostic.config({
  virtual_text = false,
  globals = { "vim" },
})

lsp.on_attach(function(client, bufnr)
  local options = { buffer = bufnr, remap = false }
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, options)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, options)
  vim.keymap.set('n', '<leader>vws', vim.lsp.buf.workspace_symbol, options)
  vim.keymap.set('n', '<leader>vd', vim.diagnostic.open_float, options)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_next, options)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_prev, options)
  vim.keymap.set('n', '<leader>vca', vim.lsp.buf.code_action, options)
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

lsp.setup()
