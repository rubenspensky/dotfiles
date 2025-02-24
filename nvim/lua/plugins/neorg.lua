return {
  "nvim-neorg/neorg",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("neorg").setup({
      load = {
        ["core.defaults"] = {},
        ["core.dirman"] = {
          config = {
            workspaces = {
              notas = "~/notas",
            },
            default_workspace = "notas",
            index = "index.norg",
          },
        },
        ["core.completion"] = {
          config = {
            engine = "nvim-cmp",
          },
        },
        ["core.journal"] = {
          config = {
            strategy = "flat",
            workspace = "notas",
          },
        },
        ["core.concealer"] = {},
      },
    })
  end,
}
