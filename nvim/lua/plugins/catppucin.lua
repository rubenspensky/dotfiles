return {
  {
    "catppuccin/nvim",
    opts = {
      dim_inactive = { enabled = true, shade = "dark", percentage = 0.10 },

      custom_highlights = function(_)
        local bg = "#070809" -- papel oscuro
        local bg2 = "#0C0F12" -- panel/floats
        local line = "#11161B" -- cursorline
        local border = "#1A1F24" -- separadores/bordes
        local fg = "#F3EEE6" -- marfil (match kitty)
        local muted = "#C6BFB6" -- gris claro legible
        local sepia = "#C6B089" -- acento
        local redsoft = "#B07A6A" -- error suave

        return {
          -- Base
          Normal = { fg = fg, bg = bg },
          NormalNC = { fg = fg, bg = bg },
          EndOfBuffer = { fg = bg, bg = bg },

          -- Floats / popups
          NormalFloat = { fg = fg, bg = bg2 },
          FloatBorder = { fg = border, bg = bg2 },

          -- Separadores / splits
          VertSplit = { fg = border, bg = bg },
          WinSeparator = { fg = border, bg = bg },

          -- Línea actual y números
          LineNr = { fg = muted, bg = bg },
          CursorLineNr = { fg = fg, bg = line, bold = true },
          CursorLine = { bg = line },
          ColorColumn = { bg = line },
          SignColumn = { bg = bg },

          -- Selección y búsqueda (sepia)
          Visual = { bg = "#151B22" },
          Search = { fg = bg, bg = sepia },
          IncSearch = { fg = bg, bg = sepia },

          -- Menús
          Pmenu = { fg = fg, bg = bg2 },
          PmenuSel = { fg = fg, bg = "#151B22" },
          PmenuSbar = { bg = border },
          PmenuThumb = { bg = muted },

          -- Diagnósticos (sin neón)
          DiagnosticError = { fg = redsoft },
          DiagnosticWarn = { fg = sepia },
          DiagnosticInfo = { fg = muted },
          DiagnosticHint = { fg = muted },

          -- Comentarios
          Comment = { fg = muted, italic = true },

          -- Matchparen sutil
          MatchParen = { fg = sepia, bold = true },

          -- Neo-tree (esto arregla que “no se vea como el resto”)
          NeoTreeNormal = { fg = fg, bg = bg },
          NeoTreeNormalNC = { fg = fg, bg = bg },
          NeoTreeEndOfBuffer = { fg = bg, bg = bg },
          NeoTreeFloatNormal = { fg = fg, bg = bg2 },
          NeoTreeFloatBorder = { fg = border, bg = bg2 },
        }
      end,
    },
  },
}
