return {
  {
    "yetone/avante.nvim",
    opts = {
      provider = "codex",
      acp_providers = {
        codex = {
          command = "npx",
          args = { "@zed-industries/codex-acp" },
        },
      },
    },
  },
}
