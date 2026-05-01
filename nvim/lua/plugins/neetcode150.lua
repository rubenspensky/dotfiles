return {
  "rubenspensky/neetcode150.nvim",
  name = "neetcode150",
  dependencies = { "kawre/leetcode.nvim" },
  cmd = "Neetcode",
  config = function()
    require("neetcode150").setup()
  end,
}
