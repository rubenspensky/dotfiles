-- lua/config/lazy.lua
return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha", -- opciones: latte, frappe, macchiato, mocha
      background = { -- configuración personalizada para el fondo
        light = "latte",
        dark = "mocha",
      },
      transparent_background = false, -- hace el fondo transparente
      term_colors = true, -- establece los colores del terminal
      dim_inactive = {
        enabled = false, -- atenúa las ventanas inactivas
        shade = "dark",
        percentage = 0.15,
      },
      styles = { -- personaliza los estilos de resaltado
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },
      color_overrides = {},
      custom_highlights = {},
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = {
          enabled = true,
          indentscope_color = "",
        },
      },
    },
  },
}
