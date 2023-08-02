return {
  -- add go to treesitter
  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   opts = function(_, opts)
  --     vim.list_extend(opts.ensure_installed, { "go" })
  --   end,
  -- },

  -- correctly setup lspconfig
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "ray-x/go.nvim",
        -- dependencies = { -- optional packages
        --   "ray-x/guihua.lua",
        -- },
        -- event = { "CmdlineEnter" },
        ft = { "go", "gomod" },
        -- build = ':lua require("go.install").update_all_sync()',
        -- if you need to install/update all binaries
        build = function()
          require("go.install").update_all_sync()
        end,
      },
    },
    opts = {
      servers = {
        gopls = {
          settings = {
            gopls = {
              hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
              },
            },
          },
          on_attach = function(client, _)
            require("go").setup({
              lsp_cfg = false,
              lsp_keymaps = false,
              lsp_inlay_hints = {
                enable = false,
              },
            })

            -- local cfg = require("go.lsp").config() -- config() return the go.nvim gopls setup
            -- local cfg_new = vim.tbl_deep_extend("force", cfg, {
            --   client.gopls.settings,
            -- })
            -- require("lspconfig").gopls.setup(cfg_new)
          end,
        },
      },
    },
  },
}
