-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- vim.keymap.set({ "n", "v" }, "d", '"_d', { desc = "Delete without copying" })
-- vim.keymap.set({ "n", "v" }, "yd", '"+d', { desc = "Delete and copying" })
-- vim.keymap.set({ "n", "v" }, "D", '"_D', { desc = "Delete without copying" })

vim.keymap.set("n", "U", "<C-r>", { desc = "Re-do" })

local Util = require("lazyvim.util")
vim.keymap.set("n", "<C-_>", function()
  Util.terminal(nil, { border = "rounded" })
end, { desc = "Term with border" })
