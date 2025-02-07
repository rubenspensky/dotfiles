return {
  "nvim-neorg/neorg",
  build = ":Neorg sync-parsers",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-treesitter/nvim-treesitter-textobjects",
    "nvim-cmp",
  },
  config = function()
    require("neorg").setup({
      load = {
        ["core.defaults"] = {}, -- Carga las configuraciones por defecto

        ["core.concealer"] = { -- Mejora la visualización
          config = {
            icon_preset = "diamond",
            icons = {
              code_block = {
                enabled = true,
              },
            },
          },
        },

        ["core.dirman"] = { -- Gestión de directorios
          config = {
            workspaces = {
              notas = "~/notas",
              trabajo = "~/notas/trabajo",
              personal = "~/notas/personal",
              proyectos = "~/temp/proyectos",
            },
            default_workspace = "notas",
            index = "index.norg",
          },
        },

        ["core.completion"] = { -- Autocompletado
          config = {
            engine = "nvim-cmp",
            name = "[Neorg]",
          },
        },

        ["core.journal"] = { -- Configuración del diario
          config = {
            strategy = "flat",
            workspace = "personal",
          },
        },

        ["core.keybinds"] = { -- Atajos de teclado personalizados
          config = {
            default_keybinds = true,
            neorg_leader = "<Leader>n",
          },
        },

        ["core.export"] = {}, -- Soporte para exportación
        ["core.export.markdown"] = {}, -- Solo necesitamos markdown
        ["core.summary"] = {}, -- Genera resúmenes automáticos

        ["core.presenter"] = { -- Modo presentación
          config = {
            zen_mode = "zen-mode",
          },
        },

        ["core.itero"] = {}, -- Mejora la experiencia de listas

        ["core.qol.toc"] = { -- Tabla de contenidos
          config = {
            close_after_use = true,
          },
        },

        ["core.esupports.metagen"] = { -- Generación de metadata
          config = {
            type = "auto",
          },
        },
      },
    })
  end,
}
