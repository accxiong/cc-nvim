return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        auto_install = true,
        ensure_installed = {
          "css",
          "html",
          "javascript",
          "json",
          "lua",
          "rust",
          "typescript",
          "vim",
          "vue",
          "scss",
          "markdown",
          "markdown_inline",
          "yaml",
          "vimdoc",
          "go",
          "python",
        },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
}
