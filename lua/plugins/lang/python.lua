return {
  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    opts = {
      ensure_installed = { "python", "toml", "yaml" },
    },
    opts_extend = { "ensure_installed" },
  },

  {
    "williamboman/mason.nvim",
    optional = true,
    opts = {
      ensure_installed = {
        "pyright",
        "black",
        "isort",
      },
    },
    opts_extend = { "ensure_installed" },
  },

  {
    "neovim/nvim-lspconfig",
    optional = true,
    opts = {
      servers = {
        pyright = {
          settings = {
            python = {
              analysis = {
                autoImportCompletions = true,
                typeCheckingMode = "standard",
                inlayHints = {
                  variableTypeHints = false,
                  functionReturnTypeHints = false,
                  callArgumentTypeHints = false,
                },
              },
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
        python = { "isort", "black" },
      },
    },
  },

  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        python = { "pylint" },
      },
    },
  },

}
