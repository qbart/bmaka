-- local efm = require('lsp/efm')
local on_attach = require('lsp/on_attach')
local native_capabilities = vim.lsp.protocol.make_client_capabilities()
local loaded_cmp, capabilities = pcall(require, 'cmp_nvim_lsp')
local installer_loaded, lsp_installer_servers = pcall(require, 'nvim-lsp-installer.servers')
local lspconfig_loaded, lspconfig = pcall(require, 'lspconfig')
local nnoremap = require('config_helper').nnoremap

if not installer_loaded then
  print('nvim-lsp-installer not installed')
end

if not lspconfig_loaded then
  print('lspconfig not installed')
end

if loaded_cmp then
  capabilities = capabilities.update_capabilities(native_capabilities)
else
  print('cmp_nvim_lsp not installed')
  capabilities = native_capabilities
end

capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

local servers = {
  "vimls",
  "yamlls",
  "cssls",
  "jsonls",
  "solidity_ls",
  "sqlls",
  "sqls",
  "stylelint_lsp",
  "tsserver",
  "vuels",
  -- "solargraph", install this one manually - gem install solargraph
  "sumneko_lua",
  -- "efm", -- switched to null-ls
  "bashls",
  "dockerls",
  "html",
  "graphql",
  "terraformls",
}

local install_missing_servers = function()
  for _, server_name in pairs(servers) do
    local server_available, server = lsp_installer_servers.get_server(server_name)
    if server_available then
      if not server:is_installed() then
        server:install()
      end
    end
  end
end

local M = {}

M.setup_servers = function()
  local loaded_installer, lsp_installer = pcall(require, "nvim-lsp-installer")
  if not loaded_installer then
    return
  end

  install_missing_servers()

  lsp_installer.on_server_ready(function(server)
    local opts = {
      capabilities = capabilities,
      on_attach = on_attach,
      root_dir = vim.loop.cwd,
      flags = {
        debounce_text_changes = 150,
      }
    }

    if server.name == "solargraph" then
      -- opts.cmd = { "solargraph", "stdio" }
      opts.settings = {
        solargraph = {
          diagnostics = true
        }
      }

    elseif server.name == "sumneko_lua" then
      opts.root_dir = function()
        return vim.loop.cwd()
      end
      opts.settings = {
        Lua = {
          diagnostics = {
            globals = {"vim"}
          },
          workspace = {
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
            }
          },
          telemetry = {
            enable = false
          }
        }
      }

    -- elseif server.name == "efm" then
    --   opts.filetypes = vim.tbl_keys(efm.languages)
    --   opts.init_options = {
    --     documentFormatting = true,
    --     codeAction = true,
    --     rename = false,
    --     hover = false,
    --     completion = false,
    --   }
    --   opts.settings = {
    --     rootMarkers = { '.git/', 'package.json' },
    --     languages = efm.languages
    --   }
    elseif server.name == "tsserver" then
      local function organize_imports()
        local params = {
          command = "_typescript.organizeImports",
          arguments = {vim.api.nvim_buf_get_name(0)},
          title = ""
        }
        vim.lsp.buf.execute_command(params)
      end

      opts.commands = {
        OrganizeImports = {
          organize_imports,
          description = "Organize Imports"
        }
      }
    end

    if server.name == "solargraph" then
      -- install solargraph outside of nvim-lsp-installer (there were some problems with that)
      lspconfig['solargraph'].setup(opts)
    else
      -- otherwise use nvim-lsp-installer LSPs
      server:setup(opts)
    end
    vim.cmd([[ do User LspAttach Buffers ]])
  end)

end

return M
