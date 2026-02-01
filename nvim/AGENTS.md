# AGENTS

This repo is a LazyVim-based Neovim config (Lua).
Use these notes when editing or adding files.

## Repo Layout
- `init.lua` bootstraps config.
- `lua/config/` core options, keymaps, autocmds, lazy setup.
- `lua/plugins/` plugin specs and plugin-specific config.
- `stylua.toml` formatting rules for Lua.

## Tooling Snapshot
- No package.json, pyproject.toml, Makefile, or test runner detected.
- No Cursor rules (.cursor/rules or .cursorrules) found.
- No Copilot rules (.github/copilot-instructions.md) found.
- Formatting is defined by `stylua.toml` and the Conform plugin.

## Build / Lint / Test
There are no explicit build, lint, or test commands in this repo.
Use the commands below only if the tools are available on the machine.

### Install / Update Plugins
- `nvim --headless "+Lazy! sync" +qa` (sync plugins)

### Format Lua
- `stylua .` (uses `stylua.toml`)
- Single file: `stylua lua/plugins/colorscheme.lua`

### Format Web Files (via Conform config)
- `prettier --write "**/*.{js,jsx,ts,tsx,css,html,json,yaml,md}"` if prettier is installed
- Single file: `prettier --write path/to/file.ts`

### Lint
- No lint command configured.

### Tests
- No test command configured.
- Single test: not applicable.

## Code Style (Lua)
- Indentation: 2 spaces, no tabs (`stylua.toml`).
- Max line width: 120 columns (`stylua.toml`).
- Strings: prefer double quotes for consistency with existing files.
- Trailing commas: follow stylua defaults; let the formatter decide.
- Keep functions short and focused; split large configs into helpers.
- Use `local` for variables and functions unless they must be global.
- Avoid adding comments unless a block is non-obvious.

### Imports / Requires
- Place `local <name> = require("<module>")` at top of files.
- For plugin specs, return a table and keep plugin entries declarative.
- Avoid side-effect requires in plugin tables unless needed for setup.

### Naming
- Use `snake_case` for local functions and variables.
- Use `UpperCamelCase` only for exported modules or tables when necessary.
- Keep keymap descriptions (`desc`) in English unless the file is Spanish.

### Error Handling
- Prefer early returns for guard clauses.
- Use `vim.notify` for user-facing warnings or errors.
- When calling external commands, check return codes or `vim.v.shell_error`.

## Plugin Specs
- Each file in `lua/plugins/` should return a table of plugin specs.
- Keep options in `opts = { ... }` rather than inline setup where possible.
- If a plugin requires setup, use `config = function()` and keep it local.
- Avoid enabling plugins globally unless needed; use events/ft where appropriate.

## Config Files
- `lua/config/options.lua` is for options and globals.
- `lua/config/keymaps.lua` is for keymaps; include `desc` for mappings.
- `lua/config/autocmds.lua` is for custom autocmds and user commands.
- `lua/config/lazy.lua` controls LazyVim bootstrap and defaults.

## Formatting Guidance
- Run `stylua` after editing Lua files.
- Do not hand-align tables; rely on the formatter.
- Keep table keys on separate lines when the table is long or nested.
- For JSON/YAML/Markdown, prefer Prettier if it is available.

## Neovim Conventions
- Use `vim.api.nvim_*` for buffer/window operations.
- Prefer `vim.keymap.set` over `vim.api.nvim_set_keymap`.
- For user commands, use `vim.api.nvim_create_user_command`.

## Language Scope
- Most code is Lua; configs may reference JSON/TS/JS/YAML formatting.
- Keep Lua files ASCII unless the file already uses other characters.
- The repo includes some Spanish comments; keep tone consistent within a file.

## Common Patterns in This Repo
- Plugin specs use `return { ... }` at top level.
- Keymaps include `{ noremap = true, silent = true, desc = "..." }`.
- Options set `vim.opt.<name>` or `vim.g.<name>`.

## Adding New Plugins
- Place specs under `lua/plugins/<topic>.lua`.
- If extending LazyVim, prefer `import = "lazyvim.plugins.extras...."`.
- Ensure heavy plugins are lazy-loaded where possible.

## Updating Existing Files
- Preserve the structure and ordering used in the file.
- Avoid refactors that change behavior unless requested.
- If you add a new file, keep naming consistent with existing ones.

## Safety Notes for Agents
- Do not edit `lazy-lock.json` manually.
- Avoid making mass changes across plugin files unless required.
- If you need to update plugin versions, use Lazy's sync/update.

## Quick Reference
- Entry point: `init.lua`
- Lazy bootstrap: `lua/config/lazy.lua`
- Options: `lua/config/options.lua`
- Keymaps: `lua/config/keymaps.lua`
- Autocmds: `lua/config/autocmds.lua`

## If You Need a Single-File Change
- Update the target file.
- Run `stylua <file>` for Lua.
- No tests to run after changes.

## If You Need a Multi-File Change
- Keep changes scoped to relevant `lua/` modules.
- Prefer small, composable helper functions.
- Format all touched Lua files with `stylua`.

## Troubleshooting
- If Neovim fails to start, remove plugin caches under `~/.local/share/nvim/lazy`.
- If a plugin requires a build step, check its README; some use `make`.

## Environment Notes
- This repo is a dotfiles Neovim config; it is not an app with CI tests.
- Assume local tools may be missing; do not add new dependencies lightly.

## Requesting Clarification
- Ask only if the change alters editor behavior or default keymaps broadly.
- Otherwise, follow existing patterns and keep the change minimal.

## EOF
