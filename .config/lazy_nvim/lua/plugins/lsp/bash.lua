return {

  -- add bash to treesitter
  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   opts = function(_, opts)
  --     vim.list_extend(opts.ensure_installed, { "bash" })
  --   end,
  -- },

  -- ensure mason-lspconfig installs the server
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        bashls = {},
      },
    },
  },

  -- linters and formatters
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "shfmt", "shellcheck" })
    end,
  },
}
