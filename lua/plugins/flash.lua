return {
  {
    "rainzm/flash-zh.nvim",
    event = "VeryLazy",
    dependencies = { "folke/flash.nvim" },
    keys = {
      {
        "<leader>f",
        mode = { "n", "x", "o" },
        function()
          require("flash-zh").jump({ chinese_only = false })
        end,
        desc = "Falsh between Chinese",
      },
      {
        "f",
        mode = { "n", "x", "o" },
        function()
          require("flash-zh").jump({ chinese_only = false })
        end,
        desc = "Falsh between Chinese",
        "Falsh between Chinese",
      },
    },
  },
  {
    "folke/flash.nvim",
    event = "BufReadPost",
    opts = {
      label = {
        rainbow = {
          enabled = true,
          shade = 1,
        },
      },
      modes = {
        char = {
          enabled = false,
        },
      },
    },
    keys = {
      -- stylua: ignore
      -- { "<leader>f", mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "[Flash] Jump" },
      -- { "f",         mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "[Flash] Jump", },
      -- stylua: ignore
      { "<leader>F", mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "[Flash] Treesitter" },
      -- stylua: ignore
      -- { "<leader>F", mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "[Flash] Treesitter Search" },
      -- stylu: ignore
      {
        "<c-f>",
        mode = { "c" },
        function()
          require("flsh").toggle()
        end,
        desc = "[Flash] Toggle Search",
      },
      {
        "<leader>j",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump({
            search = { mode = "search", max_length = 0 },
            label = { after = { 0, 0 }, matches = false },
            jump = { pos = "end" },
            pattern = "^\\s*\\S\\?", -- match non-whitespace at start plus any character (ignores empty lines)
          })
        end,
        desc = "[Flash] Line jump",
      },
      {
        "<leader>k",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump({
            search = { mode = "search", max_length = 0 },
            label = { after = { 0, 0 }, matches = false },
            jump = { pos = "end" },
            pattern = "^\\s*\\S\\?", -- match non-whitespace at start plus any character (ignores empty lines)
          })
        end,
        desc = "[Flash] Line jump",
      },
    },
  },
}
