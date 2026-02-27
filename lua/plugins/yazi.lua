return {
  "mikavilpas/yazi.nvim",
  dependencies = { "folke/snacks.nvim" },
  -- stylua: ignore
  keys = {
    { '<leader>mm', "<CMD>Yazi<CR>",        mode = 'n' },
    { "<leader>E",  "<CMD>Yazi<CR>",        desc = "[Yazi] open at the current file", mode = { "n", "v" } },
    { "<leader>cw", "<CMD>Yazi cwd<CR>",    desc = "[Yazi] open in working directory" },
    { "<c-up>",     "<CMD>Yazi toggle<CR>", desc = "[Yazi] Resume the last session" },
  },
  opts = {
    open_for_directories = false,
    keymaps = {
      show_help = "<f1>",
    },
  },
  init = function()
    vim.g.loaded_netrwPlugin = 1
  end,
}
