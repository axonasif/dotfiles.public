function printi(payload)
  print(vim.inspect(payload))
end

local M = {}

---@param pkg_name string
---@param callback function
function M.mason_install_sync(pkg_name, callback)
  local mason_reg = require("mason-registry")
  local package = mason_reg.get_package(pkg_name)
  if not package:is_installed() then
    package:install():once(
      "closed",
      vim.schedule_wrap(function()
        callback()
      end)
    )
  else
    callback()
  end
end

---@param server_name string
---@param callback function
function M.mason_install_lspserver(server_name, callback)
  local mlsp_servers = require("mason-lspconfig.mappings.server").lspconfig_to_package
  local pkg_name = mlsp_servers[server_name]
  if not pkg_name then
    return
  end

  M.mason_install_sync(pkg_name, callback)
end

return M
