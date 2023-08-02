return {
  -- add rust to treesitter
  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   opts = function(_, opts)
  --     vim.list_extend(opts.ensure_installed, { "rust" })
  --   end,
  -- },

  -- correctly setup lspconfig
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "simrat39/rust-tools.nvim",
    },
    opts = {
      -- make sure mason installs the server
      servers = {
        ---@type lspconfig.options.rust_analyzer
        rust_analyzer = {
          -- NOTE: Alternative method
          -- on_attach = function(client, bufnr)
          --   local rt = require("rust-tools")
          --
          --   rt.setup({
          --     tools = {
          --       inlay_hints = {
          --         auto = false,
          --       },
          --     },
          --   })
          --
          --   vim.keymap.set("n", "K", rt.hover_actions.hover_actions, { buffer = buffer })
          -- end,
        },
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

  -- Companion plugins
  {
    "saecki/crates.nvim",
    ft = "toml",
    dependencies = {
      "nvim-lua/plenary.nvim",
      -- {
      "hrsh7th/nvim-cmp",
      -- NOTE: Appearently this doesn't work as expected,
      -- it kinda works but not exactly as `require("cmp").setup_buffer()` as you see in `config =`.
      --
      -- ---@param opts cmp.ConfigSchema
      -- opts = function(_, opts)
      --   -- local cmp = require("cmp")
      --   table.insert(opts.sources, 1, { name = "crates", group_index = 2 })
      --   -- opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "crates" } }))
      -- end,
      -- },
    },
    opts = {
      null_ls = {
        enabled = true,
        name = "crates.nvim",
      },
    },
    config = function(_, opts)
      require("crates").setup(opts)
      require("cmp").setup.buffer({ sources = { { name = "crates" } } })
    end,
  },
}
