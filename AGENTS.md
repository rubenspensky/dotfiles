# AGENTS

This repository is a personal dotfiles setup for Neovim (LazyVim), Zellij, and helper scripts.
Use these notes when editing or adding files.

## Repo Layout
- `README.md` setup instructions and system bootstrapping.
- `nvim/` LazyVim-based Neovim config (Lua).
- `zellij/` Zellij config (`.kdl`) and layouts.
- `scripts/` helper scripts (currently `neorg-sync.fish`).

## Rule Files (Cursor/Copilot)
- No Cursor rules (`.cursor/rules/` or `.cursorrules`) found.
- No Copilot rules (`.github/copilot-instructions.md`) found.

## Tooling Snapshot
- No root `package.json`, `pyproject.toml`, `Makefile`, `Justfile`, or test runner detected.
- `nvim/` has its own `AGENTS.md` with Lua-specific guidance; prefer it for Neovim changes.

## Build / Lint / Test
There are no explicit build, lint, or test commands for the repository as a whole.
Use the commands below only if the tools are already installed on the machine.

### System Bootstrap
- `brew bundle` (install packages from `Brewfile`)

### Neovim Plugins
- `nvim --headless "+Lazy! sync" +qa` (sync plugins)

### Format Lua (Neovim)
- `stylua .` (uses `nvim/stylua.toml`)
- Single file: `stylua nvim/lua/plugins/colorscheme.lua`

### Format Web/Config Files (if Prettier is installed)
- `prettier --write "**/*.{js,jsx,ts,tsx,css,html,json,yaml,md}"`
- Single file: `prettier --write path/to/file.ts`

### Lint
- No lint command configured.
- Single file lint: not applicable.

### Tests
- No test command configured.
- Single test: not applicable.

## Code Style Guidelines
Follow existing style in each area. Keep changes minimal and consistent.

### General
- Keep files ASCII unless the file already uses non-ASCII characters.
- Preserve ordering and structure in config files.
- Avoid broad refactors unless requested.
- Avoid adding comments unless a block is non-obvious.
- Keep edits scoped to the subsystem you are working in.

### Lua (Neovim config)
- Indentation: 2 spaces, no tabs (see `nvim/stylua.toml`).
- Max line width: 120 columns.
- Strings: prefer double quotes to match existing files.
- Trailing commas: follow stylua defaults; let the formatter decide.
- Keep functions small; split large configs into helpers.
- Use `local` for variables and helper functions.

#### Imports / Requires
- Place `local <name> = require("<module>")` at the top of files.
- Plugin specs should `return { ... }` and stay declarative.
- Avoid side-effect requires in plugin tables unless required.

#### Naming
- Use `snake_case` for local variables and functions.
- Use `UpperCamelCase` only for exported modules when needed.
- Keep keymap `desc` strings in English unless the file is Spanish.

#### Types and APIs
- Lua is dynamically typed; avoid introducing type annotation frameworks.
- Prefer `vim.api.nvim_*` for buffer/window operations.
- Prefer `vim.keymap.set` over `vim.api.nvim_set_keymap`.
- For user commands, use `vim.api.nvim_create_user_command`.

#### Error Handling
- Prefer guard clauses with early returns.
- Use `vim.notify` for user-facing warnings/errors.
- When calling external commands, check `vim.v.shell_error`.

#### Plugin Specs
- Use `opts = { ... }` where possible.
- If setup is required, use `config = function()` with local scope.
- Prefer lazy-loading via events/ft where appropriate.

### Zellij (KDL)
- Preserve formatting and indentation in `.kdl` files.
- Keep sections grouped (keybinds, layout, theme).
- When adding keybinds, follow the existing comment style.

### Scripts (`scripts/`)
- Scripts may be destructive; read carefully before editing.
- `scripts/neorg-sync.fish` uses `git reset --hard` and `git push --force`.
- Do not run or modify destructive behavior unless explicitly requested.

## Practical Conventions
- Use repo-relative paths in references (e.g., `nvim/lua/config/options.lua`).
- Keep config files small and modular; add new files rather than bloating.
- Match the surrounding file structure and ordering.

## Adding New Files
- Place new Neovim plugins in `nvim/lua/plugins/`.
- Place new Zellij layouts in `zellij/layouts/`.
- Prefer descriptive filenames with lowercase and hyphens/underscores.

## Safety Notes for Agents
- Do not edit `nvim/lazy-lock.json` by hand.
- Avoid mass edits across config files unless needed.
- If updating plugins, use Lazy sync rather than manual lock changes.
- Be cautious with scripts that alter git state or system services.

## If You Need a Single-File Change
- Update the target file.
- Format only when the tool exists (e.g., `stylua <file>`).
- No tests to run after changes.

## If You Need a Multi-File Change
- Keep changes scoped to the relevant subsystem.
- Prefer small, composable helper functions.
- Format all touched Lua files with `stylua` if available.

## Troubleshooting
- Neovim plugin issues: remove caches under `~/.local/share/nvim/lazy`.
- Zellij plugin issues: verify `zellij/plugins/zjstatus.wasm` path.

## Environment Notes
- This is a dotfiles repo, not an application with CI.
- Assume local tools may be missing; do not add dependencies lightly.
- Keep behavior changes minimal unless explicitly requested.

## Requesting Clarification
- Ask only if the change alters editor behavior or default keymaps broadly.
- Otherwise, follow existing patterns and keep the change minimal.

## EOF
