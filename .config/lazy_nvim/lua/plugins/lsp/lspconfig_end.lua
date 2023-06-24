return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    -- Run in headless mode
    if #vim.api.nvim_list_uis() == 0 then
      -- get all the servers that are available thourgh mason-lspconfig
      local servers = opts.servers
      local have_mason, mlsp = pcall(require, "mason-lspconfig")
      local all_mslp_server_names, mslp_servers = {}, {}

      if have_mason then
        mslp_servers = require("mason-lspconfig.mappings.server").lspconfig_to_package
        all_mslp_server_names = vim.tbl_keys(mslp_servers)
        local ensure_installed = {} ---@type string[]
        for server, server_opts in pairs(servers) do
          if server_opts then
            server_opts = server_opts == true and {} or server_opts
            if server_opts.mason ~= false and vim.tbl_contains(all_mslp_server_names, server) then
              ensure_installed[#ensure_installed + 1] = mslp_servers[server]
            end
          end
        end

        local required_installations = {}
        local mr = require("mason-registry")
        for _, lsp in ipairs(ensure_installed) do
          local p = mr.get_package(lsp)
          if not p:is_installed() then
            required_installations[#required_installations + 1] = lsp
          end
        end
        require("mason.api.command").MasonInstall(required_installations)
        --
      end
    end
  end,
}
