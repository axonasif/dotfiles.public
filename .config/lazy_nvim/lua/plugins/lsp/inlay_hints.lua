return {
  "lvimuser/lsp-inlayhints.nvim",
  enabled = false,
  dependencies = { "neovim/nvim-lspconfig" },
  event = "LspAttach",
  config = function()
    require("lsp-inlayhints").setup()

    vim.api.nvim_create_autocmd("LspTokenUpdate", {
      once = true,
      callback = function(args)
        if not (args.data and args.data.client_id) then
          return
        end
        print("gotcha")

        local buffer = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        require("lsp-inlayhints").on_attach(client, buffer)
      end,
    })
  end,
}
