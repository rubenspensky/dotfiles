return {
  {
    "akinsho/bufferline.nvim",
    enabled = false,
  },

  {
    "folke/noice.nvim",
    opts = {
      cmdline = {
        view = "cmdline", -- Usa la vista clásica para la línea de comandos
      },
      presets = {
        bottom_search = true, -- Habilita la búsqueda en la parte inferior
        command_palette = true, -- Habilita la paleta de comandos
        lsp_doc_border = true, -- Habilita el borde en la documentación LSP
      },
    },
  },
}
