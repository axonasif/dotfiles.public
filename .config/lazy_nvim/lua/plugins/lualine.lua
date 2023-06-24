return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
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
    i = 1
    while i <= #opts.sections.lualine_x do
      local component = opts.sections.lualine_x[i]
      -- Check if it's a table and if the first element is a function from "lazy.status"
      if
        type(component) == "table"
        and type(component[1]) == "function"
        and string.find(tostring(component[1]), "lazy.status")
      then
        -- Unset the table
        table.remove(opts.sections.lualine_x, i)
      else
        i = i + 1
      end
    end
  end,
}
