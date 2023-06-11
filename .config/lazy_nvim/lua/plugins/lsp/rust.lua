return {

  -- add rust to treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "rust" })
      end
    end,
  },

  -- correctly setup lspconfig
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "simrat39/rust-tools.nvim",
        ft = "rust",
      },
    },
    opts = {
      -- make sure mason installs the server
      servers = {
        ---@type lspconfig.options.rust_analyzer
        rust_analyzer = {
          settings = {
            ["rust-analyzer"] = { nil },
          },
          -- mason = false,
        },
      },
      setup = {
        rust_analyzer = function(_, opts)
          require("rust-tools").setup({
            tools = {
              inlay_hints = {
                auto = true,
              },
            },

            server = {
              on_attach = function(_, bufnr)
                require("lazyvim.util").on_attach(function(_, bufnr)
                  local rt = require("rust-tools")
                  vim.keymap.set("n", "K", rt.hover_actions.hover_actions, { buffer = bufnr })
                end)
              end,

              -- capabilities = require("cmp_nvim_lsp").default_capabilities(),
              settings = {
                ["rust-analyzer"] = { nil },
              },
            },
          })

          return true -- do not setup with lspconfig
        end,
      },
    },
  },
}
