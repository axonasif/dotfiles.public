return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    opts.options.theme = "palenight"
    opts.options.component_separators = "|"
    opts.options.section_separators = ""

    opts.sections.lualine_a = {
      {
        "mode",
        fmt = function(str)
          return str:sub(1, 1)
        end,
      },
    }
    opts.sections.lualine_z = { nil }

    -- Iterate over lualine_c section
    local i = 1
    while i <= #opts.sections.lualine_c do
      local component = opts.sections.lualine_c[i]
      -- Check if it's a table and if it has a field called "filename" or "filetype"
      if type(component) == "table" and (component[1] == "filename" or component[1] == "filetype") then
        -- Unset the "filename" or "filetype" table
        table.remove(opts.sections.lualine_c, i)
      else
        i = i + 1
      end
    end

    -- Iterate over lualine_x section
    for j, v in ipairs(opts.sections.lualine_x) do
      -- Change this condition to match the item you want to remove
      if v[1] == require("lazy.status").updates and v.cond == require("lazy.status").has_updates then
        -- Remove the lazy plugins updates indicator
        table.remove(opts.sections.lualine_x, j)
        break
      end
    end
  end,
}
