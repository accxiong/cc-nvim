-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- vim.g.mapleader = " "
-- vim.g.maplocalleader = " "

vim.opt.number = true
vim.wo.cursorline = true -- 行高亮
vim.opt.list = true
vim.opt.listchars = { tab = ">-", trail = "-" }
vim.opt.autoread = true       -- 自动重载变更
vim.opt.autoindent = true
vim.opt.jumpoptions = "stack" -- gd ctrl+o 跳转模型
vim.opt.swapfile = false

-- Tab related options
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- - "t"  -- 不根据 textwidth 自动换行
-- - "c"  -- 不自动换行注释
-- - "r"  -- 不自动插入注释
-- - "o"  -- 不自动插入注释（使用o/O时）
-- - "q"  -- 允许使用gq格式化注释
-- - "l"  -- 不自动换行长行
-- - "a"  -- 不自动格式化段落
vim.api.nvim_create_autocmd({ "FileType" }, {
  command = "set formatoptions-=ro",
})

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  pattern = "*",
  command = "if mode() != 'c' | checktime | endif",
})

-- 文件变更时的通知
vim.api.nvim_create_autocmd("FileChangedShellPost", {
  pattern = "*",
  command = "echohl WarningMsg | echo '文件已被外部程序修改' | echohl None",
})

vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "*",
  callback = function()
    if vim.bo.buftype == "help" then
      vim.cmd("wincmd L") -- 右侧打开
    end
  end,
})

vim.wo.wrap = false                     -- 防止包裹

vim.opt.mouse:append("a")               -- 启用鼠标

vim.opt.clipboard:append("unnamedplus") -- 系统剪贴板

vim.opt.splitright = true               -- 默认新窗口右和下
vim.opt.splitbelow = true

vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"



vim.o.tabstop = 4        -- Tab 显示为 4 个空格宽度
vim.bo.tabstop = 4
vim.o.softtabstop = 4    -- 插入模式下 Tab 的软宽度
vim.o.shiftround = true  -- >> << 时对齐到 shiftwidth 的倍数
vim.o.shiftwidth = 4     -- 自动缩进时每级缩进为 4 个空格
vim.bo.shiftwidth = 4
vim.o.expandtab = true   -- 将 Tab 转为空格
vim.bo.expandtab = true
vim.o.autoindent = true  -- 自动继承上一行缩进
vim.bo.autoindent = true
vim.o.smartindent = true -- 根据语法自动缩进
