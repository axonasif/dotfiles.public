return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.auto_install = true
      opts.ensure_installed = { nil }
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("treesitter-context").setup()
    end,
  },
}
