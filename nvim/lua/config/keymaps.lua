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

-- Añade estos keymaps globales

-- Atajos para workspaces
vim.keymap.set("n", "<leader>nw", ":Neorg workspace ", { desc = "Cambiar workspace" })
vim.keymap.set("n", "<leader>nn", ":Neorg workspace notas<CR>", { desc = "Workspace notas" })
-- vim.keymap.set("n", "<leader>nt", ":Neorg workspace trabajo<CR>", { desc = "Workspace trabajo" })
vim.keymap.set("n", "<leader>np", ":Neorg workspace personal<CR>", { desc = "Workspace personal" })

-- Atajos para journal
vim.keymap.set("n", "<leader>nj", ":Neorg journal today<CR>", { desc = "Nota de hoy" })
vim.keymap.set("n", "<leader>ny", ":Neorg journal yesterday<CR>", { desc = "Nota de ayer" })

-- Atajos para gestión de notas
vim.keymap.set("n", "<leader>ni", ":Neorg index<CR>", { desc = "Ir al índice" })
vim.keymap.set("n", "<leader>nr", ":Neorg return<CR>", { desc = "Volver" })
vim.keymap.set("n", "<leader>ns", ":Neorg generate-workspace-summary<CR>", { desc = "Generar resumen" })
