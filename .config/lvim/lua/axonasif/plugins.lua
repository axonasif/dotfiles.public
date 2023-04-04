lvim.plugins = {
  { "mvllow/modes.nvim",        commit = "d65260b" },
  { "vimpostor/vim-tpipeline",  commit = "731f62d" },
  { "simrat39/rust-tools.nvim", commit = "71d2cf6" },
  { "sitiom/nvim-numbertoggle", commit = "34cd7d4" },
  { "olexsmir/gopher.nvim",     commit = "cc46546" },
  { "leoluz/nvim-dap-go",       commit = "b4ded7d" },
  {
    "kylechui/nvim-surround",
    commit = "50f6678",
    config = function()
      require("nvim-surround").setup()
    end
  },
  -- {
  --   'chrisgrieser/nvim-spider',
  --   event = 'BufRead',
  --   commit = "559c1e2",
  --   config = function()
  --     vim.keymap.set({ "n", "o", "x" }, "w", function() require("spider").motion("w") end, { desc = "Spider-w" })
  --     vim.keymap.set({ "n", "o", "x" }, "e", function() require("spider").motion("e") end, { desc = "Spider-e" })
  --     vim.keymap.set({ "n", "o", "x" }, "b", function() require("spider").motion("b") end, { desc = "Spider-b" })
  --     vim.keymap.set({ "n", "o", "x" }, "ge", function() require("spider").motion("ge") end, { desc = "Spider-ge" })
  --   end
  -- },
  -- {
  --   "folke/noice.nvim",
  --   commit = "1da4edf",
  --   config = function()
  --     require("noice").setup({
  --       -- add any options here
  --     })
  --   end,
  --   requires = {
  --     -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
  --     { "MunifTanjim/nui.nvim", commit = "4eaec2a" },
  --     -- OPTIONAL:
  --     --   `nvim-notify` is only needed, if you want to use the notification view.
  --     --   If not available, we use `mini` as the fallback
  --     { "rcarriga/nvim-notify", commit = "50d0370" },
  --   }
  -- },
  {
    "saecki/crates.nvim",
    commit = "aa94d38",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("crates").setup {
        null_ls = {
          enabled = true,
          name = "crates.nvim",
        },
      }
    end,
  },
  {
    "j-hui/fidget.nvim",
    commit = "0ba1e16",
    config = function()
      require("fidget").setup()
    end,
  },
  {
    "folke/trouble.nvim",
    commit = "7915277",
    -- requires = "kyazdani42/nvim-web-devicons", -- already available on lvim
    config = function()
      require("trouble").setup()
    end
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    commit = "fc7db28",
    requires = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("treesitter-context").setup()
    end
  },
  --[[ {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup()
    end
  }, ]]
  {
    'lvimuser/lsp-inlayhints.nvim',
    commit = "84ca3ab",
    config = function()
      require("lsp-inlayhints").setup()
    end
  },
  {
    'andweeb/presence.nvim',
    commit = "87c857a",
    config = function()
      require("presence"):setup()
    end
  },
  -- Copilot stuff
  -- { "github/copilot.vim",       commit = "b6e5624" },
  {
    "zbirenbaum/copilot.lua",
    commit = "f0b41fb",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
    end,
  },

  {
    "zbirenbaum/copilot-cmp",
    commit = "308f3cf",
    after = { "copilot.lua", "nvim-cmp" },
    config = function()
      require("copilot_cmp").setup()
    end
  },
}
