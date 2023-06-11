return {
  "williamboman/mason-lspconfig.nvim",
  enabled = false,
  dependencies = {
    "williamboman/mason.nvim",
  },
  config = function()
    require("mason-lspconfig").setup_handlers({
      function(server_name)
        return true
        -- require("lspconfig")[server_name].setup({})
      end,

      ["rust_analyzer"] = function() end,
      ["gopls"] = function() end,
    })
  end,
}
