-- keymaps
vim.keymap.set("n", "<leader>cw", vim.lsp.buf.add_workspace_folder, { desc = "Add workspace folder" })
vim.keymap.set("n", "<leader>cW", vim.lsp.buf.remove_workspace_folder, { desc = "Remove workspace folder" })

-- Fix the overwriting of lazyvim.plugins.lsp.keymaps
--
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover" })

return {
  "neovim/nvim-lspconfig",
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    keys[#keys + 1] = { "K", false }
  end,
  ---@class PluginLspOpts
  opts = {
    inlay_hints = {
      enabled = true,
    },
    -- LSP Server Settings
    ---@type lspconfig.options
    servers = {
      lua_ls = {
        -- mason = false, -- set to false if you don't want this server to be installed with mason
        settings = {
          Lua = {
            hint = {
              enable = true,
            },
          },
        },
      },
    },
  },
  ---@param opts PluginLspOpts
  config = function(_, opts)
    local Util = require("lazyvim.util")
    -- setup autoformat
    require("lazyvim.plugins.lsp.format").setup(opts)
    -- setup formatting and keymaps
    Util.on_attach(function(client, buffer)
      require("lazyvim.plugins.lsp.keymaps").on_attach(client, buffer)
    end)

    -- diagnostics
    for name, icon in pairs(require("lazyvim.config").icons.diagnostics) do
      name = "DiagnosticSign" .. name
      vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
    end

    if opts.inlay_hints.enabled and vim.lsp.buf.inlay_hint then
      Util.on_attach(function(client, buffer)
        if client.server_capabilities.inlayHintProvider then
          vim.lsp.buf.inlay_hint(buffer, true)
        end
      end)
    end

    if type(opts.diagnostics.virtual_text) == "table" and opts.diagnostics.virtual_text.prefix == "icons" then
      opts.diagnostics.virtual_text.prefix = vim.fn.has("nvim-0.10.0") == 0 and "●"
        or function(diagnostic)
          local icons = require("lazyvim.config").icons.diagnostics
          for d, icon in pairs(icons) do
            if diagnostic.severity == vim.diagnostic.severity[d:upper()] then
              return icon
            end
          end
        end
    end

    vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

    local servers = opts.servers
    local capabilities = vim.tbl_deep_extend(
      "force",
      {},
      vim.lsp.protocol.make_client_capabilities(),
      require("cmp_nvim_lsp").default_capabilities(),
      opts.capabilities or {}
    )

    -- local function get_key_for_value(tbl, target_value)
    --   for key, value in pairs(tbl) do
    --     for _, v in ipairs(value) do
    --       if v == target_value then
    --         return key
    --       end
    --     end
    --   end
    --   return nil -- Return nil if the value was not found
    -- end

    -- get all the servers that are available thourgh mason-lspconfig
    local mlsp = require("mason-lspconfig")
    local all_mslp_server_names, mslp_servers, mason_reg, filetype_mapping = {}, {}, {}, {}

    mslp_servers = require("mason-lspconfig.mappings.server").lspconfig_to_package
    all_mslp_server_names = vim.tbl_keys(mslp_servers)
    mason_reg = require("mason-registry")
    -- filetype_mapping = require("mason-lspconfig.mappings.filetype")

    local function setup(server)
      -- local lsp_ft = get_key_for_value(filetype_mapping, server)
      -- if lsp_ft == nil or lsp_ft == "" then
      --   return
      -- end

      local server_opts = vim.tbl_deep_extend("force", {
        capabilities = vim.deepcopy(capabilities),
      }, servers[server] or {})

      -- local function on_ft(callback)
      --   vim.api.nvim_create_autocmd({ "FileType" }, {
      --     pattern = { lsp_ft },
      --     once = true,
      --     callback = function(_)
      --       if callback() then
      --         vim.cmd({ cmd = "LspStart", args = { server } })
      --         return
      --       end
      --
      --       require("lspconfig")[server].setup(server_opts)
      --       vim.cmd({ cmd = "LspStart", args = { server } })
      --     end,
      --   })
      -- end

      -- If `setup` returns true then the user has manually setup the server
      -- And so we can return early instead of using lspconfig setup again
      -- if opts.setup[server] then
      --   on_ft(function()
      --     return opts.setup[server](server, server_opts)
      --   end)
      --   return
      -- elseif opts.setup["*"] then
      --   on_ft(function()
      --     return opts.setup["*"](server, server_opts)
      --   end)
      --   return
      -- end
      if opts.setup[server] then
        if opts.setup[server](server, server_opts) then
          return
        end
      elseif opts.setup["*"] then
        if opts.setup["*"](server, server_opts) then
          return
        end
      end
      require("lspconfig")[server].setup(server_opts)
    end

    mlsp.setup({
      automatic_installation = true,
      handlers = { setup },
    })

    for server, server_opts in pairs(servers) do
      if server_opts then
        server_opts = server_opts == true and {} or server_opts
        -- run manual setup if mason=false or if this is a server that cannot be installed with mason-lspconfig
        if
          server_opts.mason == false
          or not vim.tbl_contains(all_mslp_server_names, server)
          or not mason_reg.get_package(mslp_servers[server]):is_installed()
        then
          setup(server)
        end
      end
    end

    if Util.lsp_get_config("denols") and Util.lsp_get_config("tsserver") then
      local is_deno = require("lspconfig.util").root_pattern("deno.json", "deno.jsonc")
      Util.lsp_disable("tsserver", is_deno)
      Util.lsp_disable("denols", function(root_dir)
        return not is_deno(root_dir)
      end)
    end
  end,
}
