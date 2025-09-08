local map = vim.keymap.set
-- vim.keymap.set("i", "<C-h>", "<Left>")
-- vim.keymap.set("i", "<C-l>", "<Right>")
-- vim.keymap.set("i", "<C-j>", "<Down>")
-- vim.keymap.set("i", "<C-k>", "<Up>")

vim.keymap.set("i", "jk", "<Esc>")

-- vim.keymap.set("n", "<C-h>", "<C-w>h")
-- vim.keymap.set("n", "<C-l>", "<C-w>l")
-- vim.keymap.set("n", "<C-j>", "<C-w>j")
-- vim.keymap.set("n", "<C-k>", "<C-w>k")

vim.keymap.set({ "n", "x" }, "<S-H>", "^", { desc = "Start of line" })
vim.keymap.set({ "n", "x" }, "<S-L>", "$", { desc = "End of line" })
vim.keymap.set("n", "y<S-H>", "y^", { desc = "Yank from start of line" })
vim.keymap.set("n", "y<S-L>", "y$", { desc = "Yank to end of line" })

vim.keymap.set({ "n", "x" }, "Q", "<CMD>:qa<CR>")
vim.keymap.set({ "n", "x" }, "qq", "<CMD>:q<CR>")

vim.keymap.set("n", "<A-z>", "<CMD>set wrap!<CR>", { desc = "Toggle line wrap" })

map("n", "<S-Left>", "<C-w>h", { desc = "切换到左侧窗口", noremap = true, silent = true })
map("n", "<S-Right>", "<C-w>l", { desc = "切换到右侧窗口", noremap = true, silent = true })
map("n", "<S-Up>", "<C-w>k", { desc = "切换到上方窗口", noremap = true, silent = true })
map("n", "<S-Down>", "<C-w>j", { desc = "切换到下方窗口", noremap = true, silent = true })

map({ "v" }, "ie", "<Esc>ggVG", { silent = true }) -- 全选整个文件
map({ "n" }, "die", "ggdG", { silent = true })     -- 删除整个文件内容
map({ "n" }, "yie", "ggyG", { silent = true })     -- 复制整个文件内容
map({ "n" }, "cie", "ggcG", { silent = true })     --
