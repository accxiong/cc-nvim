return {
  "supermaven-inc/supermaven-nvim",
  enabled = false,
  event = "InsertEnter",
  config = function()
    require("supermaven-nvim").setup({
      keymaps = {
        accept_suggestion = "<C-y>",
        clear_suggestion = "<C-x>",
        accept_word = nil,
      },
      ignore_filetypes = {},
      color = {
        suggestion_color = "#ffffff",
        cterm = 244,
      },
      log_level = "off", -- "off", "warn", "info", "debug", "trace"
      disable_inline_completion = false,
      disable_keymaps = false,
    })
  end,
}
