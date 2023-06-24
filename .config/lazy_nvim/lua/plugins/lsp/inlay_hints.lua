return {
  "lvimuser/lsp-inlayhints.nvim",
  ft = { "js", "ts" },
  -- dependencies = { "neovim/nvim-lspconfig" },
  -- event = "LspAttach",
  config = function()
    local ih = require("lsp-inlayhints")
    ih.setup()
    require("lazyvim.util").on_attach(function(client, buffer)
      ih.on_attach(client, buffer)
    end)

    -- Speed up the initial rendering of inlay hints
    vim.api.nvim_create_autocmd("LspTokenUpdate", {
      once = true,
      callback = function(args)
        -- if not (args.data and args.data.client_id) then
        --   return
        -- end
        -- print("gotcha")

        -- local buffer = args.buf
        -- local client = vim.lsp.get_client_by_id(args.data.client_id)
        ih.show(args.buf)
        -- require("lsp-inlayhints").on_attach(client, buffer)
      end,
    })
  end,
}
