return {
  "zbirenbaum/copilot.lua",
  opts = function(_, opts)
    opts.filetypes = vim.tbl_deep_extend("force", {
      sh = function()
        if string.match(vim.fs.basename(vim.api.nvim_buf_get_name(0)), "^%.env.*") then
          -- disable for .env files
          return false
        end
        return true
      end,
    }, opts.filetypes or {})
  end,
}
