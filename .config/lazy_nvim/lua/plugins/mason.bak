return {
  "williamboman/mason.nvim",
  config = function(_, opts)
    require("mason").setup(opts)
    printi(opts)
    local mr = require("mason-registry")
    local function ensure_installed()
      if #vim.api.nvim_list_uis() == 0 then
        local required_installations = {}
        for _, tool in ipairs(opts.ensure_installed) do
          local p = mr.get_package(tool)
          if not p:is_installed() then
            required_installations[#required_installations + 1] = tool
          end
        end
        require("mason.api.command").MasonInstall(required_installations)
      else
        for _, tool in ipairs(opts.ensure_installed) do
          local p = mr.get_package(tool)
          if not p:is_installed() then
            p:install()
          end
        end
      end
    end

    if mr.refresh then
      mr.refresh(ensure_installed)
    else
      ensure_installed()
    end
  end,
}
