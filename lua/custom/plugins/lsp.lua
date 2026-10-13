return {
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },

  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'mason-org/mason.nvim', opts = {} },
      'mason-org/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      { 'j-hui/fidget.nvim', opts = {} },
      'saghen/blink.cmp',
    },
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          map('grn', vim.lsp.buf.rename, '[R]e[n]ame')
          map('gra', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })
          map('grr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
          map('gri', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
          map('grd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
          map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
          map('gO', require('telescope.builtin').lsp_document_symbols, 'Open Document Symbols')
          map('gW', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Open Workspace Symbols')
          map('grt', require('telescope.builtin').lsp_type_definitions, '[G]oto [T]ype Definition')

          -- nvim 0.10/0.11 compat shim
          local function client_supports_method(client, method, bufnr)
            if vim.fn.has 'nvim-0.11' == 1 then
              return client:supports_method(method, bufnr)
            else
              return client.supports_method(method, { bufnr = bufnr })
            end
          end

          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
            local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })
            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })
            vim.api.nvim_create_autocmd('LspDetach', {
              group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
              end,
            })
          end

          if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
            map('<leader>th', function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
            end, '[T]oggle Inlay [H]ints')
          end
        end,
      })

      vim.diagnostic.config {
        severity_sort = true,
        float = { border = 'rounded', source = 'if_many' },
        underline = true,
        signs = {
          text = vim.g.have_nerd_font and {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.WARN] = '󰀪 ',
            [vim.diagnostic.severity.INFO] = '󰋽 ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
          } or {
            [vim.diagnostic.severity.ERROR] = 'E',
            [vim.diagnostic.severity.WARN] = 'W',
            [vim.diagnostic.severity.INFO] = 'I',
            [vim.diagnostic.severity.HINT] = 'H',
          },
        },
        -- Keep the buffer quiet: spell out the diagnostic only on the cursor line.
        virtual_text = false,
        virtual_lines = { current_line = true },
      }

      vim.keymap.set('n', '<leader>td', function()
        local enabled = vim.diagnostic.config().virtual_lines ~= false
        vim.diagnostic.config { virtual_lines = enabled and false or { current_line = true } }
      end, { desc = '[T]oggle [D]iagnostic text' })

      local capabilities = require('blink.cmp').get_lsp_capabilities()

      -- Which interpreter a Python server should analyse against: an activated
      -- venv first, then one committed next to the project, then the system one.
      local function python_path(root)
        if vim.env.VIRTUAL_ENV then
          return vim.fs.joinpath(vim.env.VIRTUAL_ENV, 'bin', 'python')
        end
        for _, venv in ipairs { '.venv', 'venv', 'env' } do
          local candidate = vim.fs.joinpath(root or vim.fn.getcwd(), venv, 'bin', 'python')
          if vim.uv.fs_stat(candidate) then
            return candidate
          end
        end
        return vim.fn.exepath 'python3'
      end

      local servers = {
        clangd = {},
        gopls = {},
        vtsls = {},
        omnisharp = {},
        tailwindcss = {},
        lua_ls = {
          settings = {
            Lua = {
              completion = { callSnippet = 'Replace' },
            },
          },
        },

        -- Types, hover and navigation. Linting and imports belong to ruff.
        basedpyright = {
          before_init = function(_, config)
            config.settings.python.pythonPath = python_path(config.root_dir)
          end,
          settings = {
            python = {},
            basedpyright = {
              disableOrganizeImports = true,
              analysis = {
                typeCheckingMode = 'standard',
                diagnosticMode = 'openFilesOnly',
                inlayHints = {
                  callArgumentNames = true,
                  functionReturnTypes = true,
                  variableTypes = true,
                },
              },
            },
          },
        },

        -- Lint, quick-fix and organize imports. Hover stays with basedpyright.
        ruff = {
          on_attach = function(client)
            client.server_capabilities.hoverProvider = false
          end,
        },
      }

      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, { 'stylua', 'eslint_d', 'prettier', 'prettierd' })
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      local wp = require 'wordpress'
      vim.lsp.config('intelephense', wp.intelephense)

      -- mason-lspconfig v2 dropped `handlers`: servers are declared through
      -- vim.lsp.config and started by `automatic_enable` once Mason has them.
      for name, server in pairs(servers) do
        vim.lsp.config(name, vim.tbl_deep_extend('force', { capabilities = capabilities }, server))
      end

      require('mason-lspconfig').setup { ensure_installed = {} }
    end,
  },
}
