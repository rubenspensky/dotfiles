return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- cargar antes que UI
    opts = {
      flavour = "mocha",
      transparent_background = false,
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
