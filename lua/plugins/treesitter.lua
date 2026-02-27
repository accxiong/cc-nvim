return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    opts = {
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
        "ini",
      },
    },
    opts_extend = { "ensure_installed" },
    config = function(_, opts)
      -- 官方 API：已安装的解析器会自动跳过 (no-op if already installed)
      if opts.ensure_installed and #opts.ensure_installed > 0 then
        require("nvim-treesitter").install(opts.ensure_installed)
      end
    end,
  },
}
