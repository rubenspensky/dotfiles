-- return {
--   dir = vim.fn.expand("~/proyectos/helloplugin.nvim"),
--   lazy = false,
--   config = function()
--     require("helloplugin").setup()
--   end,
-- }
return {
  {
    dir = vim.fn.expand("~/proyectos/helloplugin.nvim/helloplugin"),
    lazy = false,
  },
}
