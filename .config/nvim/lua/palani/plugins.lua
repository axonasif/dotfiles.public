local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- dependencies
  'nvim-lua/plenary.nvim',

  -- icons
  'nvim-tree/nvim-web-devicons',

  -- fuzzy finder
  'ibhagwan/fzf-lua',

  -- window navigation
  'christoomey/vim-tmux-navigator',

  -- comments in nvim
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  },

  -- context for functions while scrolling
  'JoosepAlviste/nvim-ts-context-commentstring',

  -- AI Autocompletion
  'Exafunction/codeium.vim',

  -- color theme
  {
    "catppuccin/nvim",
    name = "catppuccin"
  },

  -- harpooooon for quick file switching
  'ThePrimeagen/harpoon',

  -- treesitter syntax highlighting
  {
    'nvim-treesitter/nvim-treesitter',
    build = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  },

  'nvim-treesitter/nvim-treesitter-context',

  -- debug via print statements
  "andrewferrier/debugprint.nvim",

  -- lazy git floating window
  'voldikss/vim-floaterm',

  -- surround
  'tpope/vim-surround',

  -- nvim colors
  "norcalli/nvim-colorizer.lua",

  -- undotree
  "mbbill/undotree",

  -- getting cocunutieeee smoooth
  'ThePrimeagen/vim-be-good',

  -- -- golang stuff
  -- {
  --   "olexsmir/gopher.nvim",
  --   dependencies = { -- dependencies
  --     "nvim-lua/plenary.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --   },
  --   ft = "go",
  --   config = function(_, opts)
  --     require("gopher").setup(opts)
  --   end,
  --   build = function()
  --     vim.cmd [[silent! GoInstallDeps]]
  --   end,
  -- },
  --
  -- -- -- debugging
  -- "mfussenegger/nvim-dap",
  -- {
  --   "dreamsofcode-io/nvim-dap-go",
  --   ft = "go",
  --   dependencies = "mfussenegger/nvim-dap",
  --   config = function(_, opts)
  --     require("dap-go").setup(opts)
  --   end
  -- },

  "slarwise/vim-tmux-send",

  -- lsp
  {
    'VonHeikemen/lsp-zero.nvim',
    dependencies = {
      -- LSP Support
      'neovim/nvim-lspconfig',
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Autocompletion
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',

      -- Snippets
      'L3MON4D3/LuaSnip',
      'rafamadriz/friendly-snippets',
    }
  }
})
