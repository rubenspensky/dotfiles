-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Salir del modo de inserción con 'jk'
vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true, desc = "Exit insert mode" })

-- Guardar con 'leader w'
vim.keymap.set("n", "<leader>w", ":w<CR>", { noremap = true, silent = true, desc = "Save file" })

-- Salir con 'leader q'
vim.keymap.set("n", "<leader>q", ":q<CR>", { noremap = true, silent = true, desc = "Quit file" })

-- Mapeo para limpiar ^M después de pegar
vim.keymap.set("n", "<leader>m", ":CleanM<CR>", { silent = true, desc = "Clean ^M characters" })
