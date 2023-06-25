return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts)
    opts.window.mappings = vim.tbl_deep_extend("force", {
      ["l"] = "open", -- overwrite
      ["h"] = "close_node",
    }, opts.window.mappings or {})

    opts.window.width = 30
  end,
}
