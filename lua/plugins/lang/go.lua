vim.lsp.enable("gopls")

return {
  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    opts = {
      ensure_installed = { "go", "gomod", "gosum" },
    },
    opts_extend = { "ensure_installed" },
  },

  {
    "mason-org/mason.nvim",
    optional = true,
    opts = {
      ensure_installed = {
        "gopls",
        "goimports",
      },
    },
    opts_extend = { "ensure_installed" },
  },

  {
    "neovim/nvim-lspconfig",
    optional = true,
    opts = {
      servers = {
        gopls = {
          settings = {
            gopls = {
              usePlaceholders = true,
              staticcheck = true,
            },
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
        go = { "goimports", "gofmt" },
      },
    },
  },
}
