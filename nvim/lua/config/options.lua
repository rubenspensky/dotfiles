-- Añade esto al principio de tu archivo de configuración
-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.backup = false -- No crea un archivo de respaldo
vim.opt.swapfile = false -- No usa un archivo swap
vim.opt.writebackup = false -- No mantiene un archivo de respaldo cuando se escribe
vim.opt.clipboard = "unnamedplus" -- Esto es lo único que necesitamos para copiar/pegar
vim.g.snacks_animate = false
