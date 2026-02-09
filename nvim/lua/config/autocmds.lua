-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
-- vim.api.nvim_create_user_command("CleanM", function()
--  vim.cmd([[silent! %s/\r//g]])
--end, {})

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    local hl = vim.api.nvim_set_hl
    hl(0, "Normal", { bg = "none" })
    hl(0, "NormalNC", { bg = "none" })
    hl(0, "EndOfBuffer", { bg = "none" })
    hl(0, "SignColumn", { bg = "none" })
    hl(0, "LineNr", { bg = "none" })
    hl(0, "Folded", { bg = "none" })
  end,
})
