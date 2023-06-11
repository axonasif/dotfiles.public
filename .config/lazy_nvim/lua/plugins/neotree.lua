return {
  "nvim-neo-tree/neo-tree.nvim",
  enabled = true,
  opts = {
    window = {
      width = 30,
      mappings = {
        ["l"] = "open", -- overwrite
        ["h"] = "close_node",
      },
    },
  },
}
