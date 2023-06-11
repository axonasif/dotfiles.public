-- which-key
return {
  "folke/which-key.nvim",
  enabled = true,
  event = "VeryLazy",
  opts = function(_, opts)
    -- see config/keymaps.lua for reason
    opts.defaults["<leader>w"] = nil
    opts.defaults["<leader>W"] = { name = "+Windows" }
  end,
}
