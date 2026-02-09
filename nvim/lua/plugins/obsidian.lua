return {
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      workspaces = {
        {
          name = "vault",
          path = "~/Vault", -- <-- cambia esto a tu ruta
        },
      },

      notes_subdir = "00-Inbox",

      daily_notes = {
        folder = "03-Daily",
        date_format = "%Y-%m-%d",
        template = "99-Templates/daily.md",
      },

      templates = {
        subdir = "99-Templates",
        date_format = "%Y-%m-%d",
        time_format = "%H:%M",
      },

      new_notes_location = "notes_subdir",
      preferred_link_style = "wiki",
    },
    keys = {
      { "<leader>on", "<cmd>ObsidianNew<cr>", desc = "Obsidian: nueva nota" },
      { "<leader>oo", "<cmd>ObsidianOpen<cr>", desc = "Obsidian: abrir en app" },
      { "<leader>os", "<cmd>ObsidianSearch<cr>", desc = "Obsidian: buscar" },
      { "<leader>od", "<cmd>ObsidianToday<cr>", desc = "Obsidian: nota de hoy" },
      { "<leader>oy", "<cmd>ObsidianYesterday<cr>", desc = "Obsidian: ayer" },
      { "<leader>ot", "<cmd>ObsidianTomorrow<cr>", desc = "Obsidian: mañana" },
      { "<leader>ol", "<cmd>ObsidianLink<cr>", desc = "Obsidian: link a nota" },
      { "<leader>ob", "<cmd>ObsidianBacklinks<cr>", desc = "Obsidian: backlinks" },
    },
  },
}
