return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      local bg = "#070809"
      local bg2 = "#0C0F12"
      local border = "#1A1F24"
      local fg = "#F3EEE6"
      local muted = "#C6BFB6"
      local sepia = "#C6B089"

      opts.options = vim.tbl_deep_extend("force", opts.options or {}, {
        theme = {
          normal = {
            a = { fg = bg, bg = sepia, gui = "bold" },
            b = { fg = fg, bg = bg2 },
            c = { fg = muted, bg = bg },
          },
          insert = { a = { fg = bg, bg = sepia, gui = "bold" } },
          visual = { a = { fg = bg, bg = sepia, gui = "bold" } },
          replace = { a = { fg = bg, bg = sepia, gui = "bold" } },
          command = { a = { fg = bg, bg = sepia, gui = "bold" } },
          inactive = {
            a = { fg = muted, bg = bg },
            b = { fg = muted, bg = bg },
            c = { fg = muted, bg = bg },
          },
        },
        section_separators = { left = "", right = "" },
        component_separators = { left = "│", right = "│" },
        globalstatus = true,
      })

      -- Más minimal: conserva lo útil, quita ruido
      opts.sections = opts.sections or {}
      opts.sections.lualine_a = { {
        "mode",
        fmt = function()
          return " "
        end,
      } } -- modo invisible (Zen)
      opts.sections.lualine_b = { { "branch", color = { fg = sepia, bg = bg } } }
      opts.sections.lualine_c = { { "filename", path = 1, color = { fg = fg, bg = bg } } }

      opts.sections.lualine_x = {
        { "diagnostics", symbols = { error = "E ", warn = "W ", info = "I ", hint = "H " } },
        { "filetype", colored = false },
      }
      opts.sections.lualine_y = { { "progress", color = { fg = muted, bg = bg } } }
      opts.sections.lualine_z = { { "location", color = { fg = muted, bg = bg } } }

      return opts
    end,
  },
}
