require 'nvim-treesitter.configs'.setup {
  sync_install = true,
  auto_install = true,
  ignore_install = { "" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = { enable = true },
  context_commentstring = {
    enable = true,
    enable_automd = false,
  }
}

