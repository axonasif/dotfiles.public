return {
  -- add python to treesitter
  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   opts = function(_, opts)
  --     vim.list_extend(opts.ensure_installed, { "python" })
  --   end,
  -- },

  -- correctly setup lspconfig
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        marksman = {},
      },
    },
  },

  -- linter
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        -- "ruff",
        -- "pylint",
        "write-good",
        "markdownlint",
      })
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      vim.list_extend(opts.sources, {
        nls.builtins.diagnostics.write_good,
        nls.builtins.formatting.markdownlint,
      })
    end,
  },
}
