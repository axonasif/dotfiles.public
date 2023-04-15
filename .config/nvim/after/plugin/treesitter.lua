require 'nvim-treesitter.configs'.setup {
  ensure_installed = { "css", "cpp", "javascript", "gitignore", "go", "html", "json", "lua", "tsx", "java", "html",
    "dockerfile", "sql" },
  sync_install = false,
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
