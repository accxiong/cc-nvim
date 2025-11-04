local is_vscode = vim.g.vscode
local unmap = vim.keymap.del
local map = vim.keymap.set

map({ "v", "o" }, "w", "iw", { silent = true })
map({ "v", "o" }, "ii", "i{", { silent = true })
map({ "v", "o" }, "ai", "a{", { silent = true })
map({ "v", "o" }, "ib", "i(", { silent = true })

map({ "v" }, "ie", "<Esc>ggVG", { silent = true }) -- 全选整个文件
map({ "n" }, "die", "ggdG", { silent = true })     -- 删除整个文件内容
map({ "n" }, "yie", "ggyG", { silent = true })     -- 复制整个文件内容
map({ "n" }, "cie", "ggcG", { silent = true })     --


vim.keymap.set("i", "jk", "<Esc>", { silent = true })
vim.keymap.set({ "n", "x" }, "<S-H>", "^", { desc = "Start of line" })
vim.keymap.set({ "n", "x" }, "<S-L>", "$", { desc = "End of line" })
vim.keymap.set("n", "y<S-H>", "y^", { desc = "Yank from start of line" })
vim.keymap.set("n", "y<S-L>", "y$", { desc = "Yank to end of line" })


-- keymap

-- 将 gj/gk 映射为 j/k ,实现 vscode 中跳过折叠块
if vim.g.vscode then
  map("n", "j", "gj", { remap = true, desc = "Move down (skip folds)", silent = true })
  map("n", "k", "gk", { remap = true, desc = "Move up (skip folds)", silent = true })
end

-- vscode 窗口移动快捷键
if vim.g.vscode then
  -- map("n", "<S-Left>", "<cmd>lua require('vscode').call('workbench.action.navigateLeft')<CR>", { desc = "Window move left" })
  -- map("n", "<S-Right>", "<cmd>lua require('vscode').call('workbench.action.navigateRight')<CR>", { desc = "Window move right" })
  -- map("n", "<S-Up>", "<cmd>lua require('vscode').call('workbench.action.navigateUp')<CR>", { desc = "Window move up" })
  -- map("n", "<S-Down>", "<cmd>lua require('vscode').call('workbench.action.navigateDown')<CR>", { desc = "Window move down" })
  map("n", "<S-Left>", function()
    pcall(function()
      require("vscode").call("workbench.action.navigateLeft")
    end)
  end, { desc = "Window move left" })

  map("n", "<S-Right>", function()
    pcall(function()
      require("vscode").call("workbench.action.navigateRight")
    end)
  end, { desc = "Window move right" })

  map("n", "<S-Up>", function()
    pcall(function()
      require("vscode").call("workbench.action.navigateUp")
    end)
  end, { desc = "Window move up" })

  map("n", "<S-Down>", function()
    pcall(function()
      require("vscode").call("workbench.action.navigateDown")
    end)
  end, { desc = "Window move down" })
end

-- 折叠相关
if vim.g.vscode then
  -- 使用 za 切换折叠，通过 VSCode 命令
  map(
    "n",
    "za",
    "<cmd>lua require('vscode').call('editor.toggleFold')<CR>",
    { desc = "Toggle fold", noremap = true, silent = true }
  )
  -- 添加其他折叠命令映射到 VSCode
  map(
    "n",
    "zR",
    "<cmd>lua require('vscode').call('editor.unfoldAll')<CR>",
    { desc = "Unfold all", noremap = true, silent = true }
  )
  map(
    "n",
    "zM",
    "<cmd>lua require('vscode').call('editor.foldAll')<CR>",
    { desc = "Fold all", noremap = true, silent = true }
  )
  map(
    "n",
    "zo",
    "<cmd>lua require('vscode').call('editor.unfold')<CR>",
    { desc = "Unfold", noremap = true, silent = true }
  )
  map("n", "zc", "<cmd>lua require('vscode').call('editor.fold')<CR>", { desc = "Fold", noremap = true, silent = true })
end

-- 重命名功能
if vim.g.vscode then
  map("n", "<leader>rn", "<cmd>lua require('vscode').call('editor.action.rename')<CR>", { desc = "Rename Symbol" })
end

-- 快速添加符号
if vim.g.vscode then
  map("n", ";;", "A;<Esc>", { desc = "Add semicolon at end" })
  map("n", ",,", "A,<Esc>", { desc = "Add comma at end" })
  map("n", "''", "viw<Esc>a'<Esc>bi'<Esc>lel", { desc = "Surround word with single quotes" })
  map("n", '""', 'viw<Esc>a"<Esc>bi"<Esc>lel', { desc = "Surround word with double quotes" })
end

-- VSCode 自定义快捷键
if vim.g.vscode then
  -- yazi 文件管理器
  map(
    { "n", "x", "o" },
    "<leader>yy",
    "<cmd>lua require('vscode').call('yazi-vscode.toggle')<CR>",
    { noremap = true, silent = true }
  )

  -- Lazygit for VSCode
  map(
    { "n", "x", "o" },
    "<leader>gg",
    "<cmd>lua require('vscode').call('lazygit.openLazygit')<CR>",
    { noremap = true, silent = true }
  )
end

-- 跳到行首: Ctrl+a，跳到行尾: Ctrl+e
-- VSCode 下修改 keybindings.json 添加如下配置
-- { "key": "ctrl+a", "command": "cursorHome", "when": "editorTextFocus" },
-- { "key": "ctrl+e", "command": "cursorEnd", "when": "editorTextFocus" }

-- 普通Neovim环境下的翻页功能：使用 9j/9k 替代 Ctrl+u/d
-- VSCode 下修改 keybindings.json 添加如下配置
-- { "key": "ctrl+d", "command": "cursorMove", "when": "editorTextFocus && neovim.mode != 'insert'", "args": { "to": "down", "by": "line", "value": 9, "revealCursor": true } },
-- { "key": "ctrl+u", "command": "cursorMove", "when": "editorTextFocus && neovim.mode != 'insert'", "args": { "to": "up", "by": "line", "value": 9, "revealCursor": true

-- VSCode 环境下禁用一些快捷键
if vim.g.vscode then
  -- 禁用 <leader>l (通常是 LazyVim 的 lazy.nvim 界面)
  pcall(function()
    unmap("n", "<leader>l")
  end)

  -- 禁用 <leader>L,
  pcall(function()
    unmap("n", "<leader>L") -- 通常是 LspInfo
  end)

  -- 禁用 <leader>ff, 文件搜索
  pcall(function()
    unmap("n", "<leader>ff")
  end)

  -- 禁用 <leader>e, 文件管理器
  pcall(function()
    unmap("n", "<leader>e")
  end)

  -- 禁用 <leader>E, 文件管理器
  pcall(function()
    unmap("n", "<leader>E")
  end)

  -- 如果需要禁用更多快捷键，可以继续添加：
  -- pcall(function()
  --   unmap("n", "<leader>xx") -- 替换为你想禁用的快捷键
  -- end)
end

-- 返回空table以满足Lazy.nvim的要求
return {}
