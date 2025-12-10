vim.lsp.enable("vtsls")
vim.lsp.enable("eslint")

-- 工具函数：判断项目是否存在 eslint/prettier 配置
local function has_eslint()
  return vim.fs.find({ ".eslintrc", ".eslintrc.js", ".eslintrc.cjs", ".eslintrc.json" }, {
    upward = true,
    stop = vim.loop.os_homedir(),
  })[1] ~= nil
end

local function has_prettier()
  return vim.fs.find({
    ".prettierrc",
    ".prettierrc.js",
    ".prettierrc.cjs",
    ".prettierrc.json",
    "prettier.config.js",
    "prettier.config.cjs",
  }, {
    upward = true,
    stop = vim.loop.os_homedir(),
  })[1] ~= nil
end

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
    "mason-org/mason.nvim",
    optional = true,
    opts = {
      ensure_installed = {
        "vtsls",
        "eslint-lsp",
        "vue-language-server",
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
    opts_extend = { "servers" },
  },

  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {

        javascript = function()
          if has_eslint() then
            return { "eslint" } -- eslint fixAll
          elseif has_prettier() then
            return { "prettierd", "prettier" }
          else
            return {} -- 不格式化
          end
        end,

        typescript = function()
          if has_eslint() then
            return { "eslint" }
          elseif has_prettier() then
            return { "prettierd", "prettier" }
          else
            return {}
          end
        end,

        typescriptreact = function()
          if has_eslint() then
            return { "eslint" }
          elseif has_prettier() then
            return { "prettierd", "prettier" }
          else
            return {}
          end
        end,

        vue = function()
          if has_eslint() then
            return { "eslint" }
          elseif has_prettier() then
            return { "prettierd", "prettier" }
          else
            return {}
          end
        end,
      },
    },
  },

}
