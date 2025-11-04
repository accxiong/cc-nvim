return {
  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    opts = {
      ensure_installed = { "typescript", "tsx", "javascript", "json", "vue" },
    },
    opts_extend = { "ensure_installed" },
  },

  {
    "williamboman/mason.nvim",
    optional = true,
    opts = {
      ensure_installed = {
        "vtsls",
        "eslint-lsp",
        "vue-language-server"
      },
    },
    opts_extend = { "ensure_installed" },
  },

  {
    "neovim/nvim-lspconfig",
    optional = true,
    opts = {
      servers = {
        vtsls = {
          filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
          settings = {
            javascript = {
              inlayHints = {
                includeInlayEnumMemberValueHints = false,
                includeInlayFunctionLikeReturnTypeHints = false,
                includeInlayFunctionParameterTypeHints = false,
                includeInlayParameterNameHints = "none",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayPropertyDeclarationTypeHints = false,
                includeInlayVariableTypeHints = false,
              },
            },
            typescript = {
              inlayHints = {
                includeInlayEnumMemberValueHints = false,
                includeInlayFunctionLikeReturnTypeHints = false,
                includeInlayFunctionParameterTypeHints = false,
                includeInlayParameterNameHints = "none",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayPropertyDeclarationTypeHints = false,
                includeInlayVariableTypeHints = false,
              },
            },
          },
          init_options = {
            preferences = {
              includeCompletionsForModuleExports = true,
              includeCompletionsWithSnippetText = true,
              includeCompletionsWithInsertTextCompletions = true,
              quotePreference = "auto",
            },
            plugins = {
              {
                name = "@vue/typescript-plugin",
                location = vim.fn.expand("$MASON/packages/vue-language-server/node_modules/@vue/language-server"),
                languages = { "vue" },
                configNamespace = "typescript",
              },
            },
          },
          handlers = {
            ["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
              if result then
                result.diagnostics = vim.tbl_filter(function(d)
                  return d.source ~= "eslint"
                end, result.diagnostics or {})
              end
              vim.lsp.diagnostic.on_publish_diagnostics(err, result, ctx, config)
            end,
          },
          on_attach = function(client, bufnr)
            if vim.bo[bufnr].filetype == "vue" then
              client.server_capabilities.semanticTokensProvider.full = false
            end
          end,
        },
        eslint = {
          settings = {
            workingDirectories = { mode = "auto" },
          },
        },
      },
    },
  },

  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        javascript = { "prettierd", "prettier", stop_after_first = true },
        typescript = { "prettierd", "prettier", stop_after_first = true },
        typescriptreact = { "prettierd", "prettier", stop_after_first = true },
        vue = { "prettierd", "prettier", stop_after_first = true },
      },
    },
  },
}
