return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    local cmp = require("cmp")
    opts.mapping["<C-d>"] = { i = cmp.mapping.scroll_docs(-4) }
  end,
}
