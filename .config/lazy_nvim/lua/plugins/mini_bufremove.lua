return {
  "echasnovski/mini.bufremove",
  keys = {
    {
      "<leader>k",
      function()
        require("mini.bufremove").delete(0, false)
      end,
      desc = "Delete Buffer",
    },
    -- {
    --   "<C-k>",
    --   function()
    --     require("mini.bufremove").delete(0, false)
    --   end,
    --   desc = "Delete Buffer",
    -- },
  },
}
