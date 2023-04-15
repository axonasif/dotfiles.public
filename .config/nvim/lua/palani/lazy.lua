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
  'nvim-lua/plenary.nvim',

  -- icons
  'nvim-tree/nvim-web-devicons',

  -- telescope plugins
  'nvim-telescope/telescope.nvim',
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build =
    'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  },

  -- window navigation
  'christoomey/vim-tmux-navigator',

  -- comments in nvim
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  },

  'JoosepAlviste/nvim-ts-context-commentstring',

  'github/copilot.vim',

  -- color theme
  'marko-cerovac/material.nvim',

  -- harpooooon for quick file switching
  'ThePrimeagen/harpoon',

  -- treesitter syntax highlighting
  {
    'nvim-treesitter/nvim-treesitter',
    build = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  },

  -- lazy git floating window
  'kdheepak/lazygit.nvim',

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
