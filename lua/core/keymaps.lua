local keymap = vim.keymap

-- vim.keymap.set("i", "<C-h>", "<Left>")
-- vim.keymap.set("i", "<C-l>", "<Right>")
-- vim.keymap.set("i", "<C-j>", "<Down>")
-- vim.keymap.set("i", "<C-k>", "<Up>")

keymap.set("i", "jk", "<Esc>")

-- vim.keymap.set("n", "<C-h>", "<C-w>h")
-- vim.keymap.set("n", "<C-l>", "<C-w>l")
-- vim.keymap.set("n", "<C-j>", "<C-w>j")
-- vim.keymap.set("n", "<C-k>", "<C-w>k")

-- -- 使用 H 切换到左侧的 buffer
-- vim.api.nvim_set_keymap('n', 'H', ':bprevious<CR>', { noremap = true, silent = true })
--
-- -- 使用 L 切换到右侧的 buffer
-- vim.api.nvim_set_keymap('n', 'L', ':bnext<CR>', { noremap = true, silent = true })
--

keymap.set({ "n", "x" }, "<S-H>", "^", { desc = "Start of line" })
keymap.set({ "n", "x" }, "<S-L>", "$", { desc = "End of line" })
keymap.set("n", "y<S-H>", "y^", { desc = "Yank from start of line" })
keymap.set("n", "y<S-L>", "y$", { desc = "Yank to end of line" })
keymap.set({ "n", "x" }, "Q", "<CMD>:qa<CR>")
keymap.set({ "n", "x" }, "qq", "<CMD>:q<CR>")
keymap.set({ "n", "x" }, "<leader>q", "<CMD>:q<CR>")
keymap.set("n", "<A-z>", "<CMD>set wrap!<CR>", { desc = "Toggle line wrap" })

keymap.set("n", "<S-Left>", "<C-w>h", { desc = "切换到左侧窗口", noremap = true, silent = true })
keymap.set("n", "<S-Right>", "<C-w>l", { desc = "切换到右侧窗口", noremap = true, silent = true })
keymap.set("n", "<S-Up>", "<C-w>k", { desc = "切换到上方窗口", noremap = true, silent = true })
keymap.set("n", "<S-Down>", "<C-w>j", { desc = "切换到下方窗口", noremap = true, silent = true })

keymap.set("n", "<D-\\>", "<C-w>v", { desc = "竖向分隔窗口", noremap = true, silent = true })
keymap.set("n", "<D-C-\\>", "<C-w>s", { desc = "横向分隔窗口", noremap = true, silent = true })
keymap.set("n", "<leader>|", "<C-w>v", { desc = "Right split window", noremap = true, silent = true })
keymap.set("n", "<leader>-", "<C-w>s", { desc = "Bottom split window", noremap = true, silent = true })

-- New tab
-- keymap.set("n", "te", ":tabedit<CR>")
-- keymap.set("n", "<tab>", ":tabnext<CR>")
-- keymap.set("n", "<s-tab>", ":tabprevious<CR>")

-- Split window
keymap.set("n", "ss", ":split<Return>")
keymap.set("n", "sv", ":vsplit<Return>")

-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sl", "<C-w>l")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")

-- Resize window
keymap.set("n", "<C-w><Left>", "<C-w><")
keymap.set("n", "<C-w><Right>", "<C-w>>")
keymap.set("n", "<C-w><Up>", "<C-w>+")
keymap.set("n", "<C-w><Down>", "<C-w>-")

keymap.set({ "v" }, "ie", "<Esc>ggVG", { silent = true }) -- 全选整个文件
keymap.set({ "n" }, "die", "ggdG", { silent = true }) -- 删除整个文件内容
keymap.set({ "n" }, "yie", "ggyG", { silent = true }) -- 复制整个文件内容
keymap.set({ "n" }, "cie", "ggcG", { silent = true }) --

vim.keymap.set("n", "<leader>L", "<CMD>Lazy<CR>", { desc = "[Lazy] Open Lazy.nvim" })

keymap.set("n", ";;", "A;<Esc>", { desc = "Add semicolon at end" })
keymap.set("n", ",,", "A,<Esc>", { desc = "Add comma at end" })
keymap.set("n", "''", "viw<Esc>a'<Esc>bi'<Esc>lel", { desc = "Surround word with single quotes" })
keymap.set("n", '""', 'viw<Esc>a"<Esc>bi"<Esc>lel', { desc = "Surround word with double quotes" })
