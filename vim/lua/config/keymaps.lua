-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<S-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
vim.keymap.set("n", "<S-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
vim.keymap.set("n", "<S-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
vim.keymap.set("n", "<S-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

vim.keymap.set("n", "U", "<C-r>", { desc = "Re-do" })

vim.keymap.set({ "n", "x" }, "d", '"_d', { noremap = true, silent = true, desc = "Delete without yanking" })
vim.keymap.set("n", "dd", '"_dd', { noremap = true, silent = true, desc = "Delete line without yanking" })

vim.keymap.set("t", "<S-Right>", function()
  Snacks.terminal(nil, { win = { split = "right" } })
end, { desc = "Right split terminal" })

vim.keymap.set("n", "<C-g>", function()
  Snacks.lazygit({ cwd = LazyVim.root.git() })
end, { desc = "Open lazygit" })

vim.keymap.set("t", "<C-g>", function()
  Snacks.lazygit({ cwd = LazyVim.root.git() })
end, { desc = "Open lazygit" })
