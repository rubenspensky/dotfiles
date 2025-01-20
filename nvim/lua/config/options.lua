-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.backup = false -- No crea un archivo de respaldo
vim.opt.swapfile = false -- No usa un archivo swap
vim.opt.writebackup = false -- No mantiene un archivo de respaldo cuando se escribe

if vim.fn.has("wsl") == 1 then
  vim.g.clipboard = {
    name = "win32yank",
    copy = {
      ["+"] = "win32yank.exe -i --crlf", -- Sistema
      ["*"] = "win32yank.exe -i --crlf", -- Primario
    },
    paste = {
      ["+"] = "win32yank.exe -o --lf", -- Sistema
      ["*"] = "win32yank.exe -o --lf", -- Primario
    },
    cache_enabled = false,
  }
end
