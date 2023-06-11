return {

  -- add go to treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "go" })
      end
    end,
  },

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
        build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
      },
    },
    opts = {
      servers = {
        gopls = {},
      },
      setup = {
        gopls = function(_, _)
          require("go").setup()
          return true
        end,
      },
    },
  },
}
