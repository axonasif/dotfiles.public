return {
  -- add rust to treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "rust",
      },
    },
  },

  -- correctly setup lspconfig
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "simrat39/rust-tools.nvim",
        -- ft = "rust",
      },
    },
    opts = {
      -- make sure mason installs the server
      servers = {
        ---@type lspconfig.options.rust_analyzer
        rust_analyzer = {},
      },
      setup = {
        rust_analyzer = function(_, _)
          local rt = require("rust-tools")

          rt.setup({
            tools = {
              inlay_hints = {
                auto = false,
              },
            },
            server = {
              on_attach = function(_, buffer)
                vim.keymap.set("n", "K", rt.hover_actions.hover_actions, { buffer = buffer })
              end,
            },
          })

          return true -- do not setup with lspconfig
        end,
      },
    },
  },
}
