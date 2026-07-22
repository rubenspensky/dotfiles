# AGENTS

High-signal notes for OpenCode in this repo.

## Scope and entrypoints
- This is a dotfiles repo (not an app): main active areas are `nvim/`, `hypr/`, `waybar/`, `zellij/`, `scripts/`.
- Neovim has its own guide at `nvim/AGENTS.md`; follow that first for anything under `nvim/`.
- Hyprland is configured from `hypr/hyprland.lua`, which composes `hypr/modules/*.lua`.
- `hypr/hyprland.conf.bak` is an old backup-style config; do not treat it as the primary source.
- Waybar config lives in `waybar/config` and `waybar/style.css`; custom module scripts live alongside them in `waybar/`.

## Verified commands
- Neovim plugin sync: `nvim --headless "+Lazy! sync" +qa`
- Format Lua (Neovim): `stylua nvim` (or `stylua <file>`)
- Hyprland reload after `hypr/` edits: `hyprctl reload`
- Restart Waybar after `waybar/` edits: `killall waybar && waybar &`

## Repo facts worth not guessing
- No CI workflows found in `.github/workflows/`.
- No root task runner/manifests found (`package.json`, `pyproject.toml`, `Makefile`, `Justfile`, `Taskfile`, pre-commit config).
- `README.md` references `brew bundle`, but no `Brewfile` is present in this checkout.

## Risky/destructive areas
- `scripts/neorg-sync.fish` is intentionally destructive (`git reset --hard`, `git pull --force`, `git push --force`, commit with `--no-verify`).
- Do not run or “clean up” that script unless explicitly asked.

## Local conventions to preserve
- Keep changes minimal and scoped; preserve ordering/structure in config files.
- Prefer editing existing module files over moving config between subsystems.
- Waybar custom modules in this repo currently include `custom/alexa` and `custom/codex`; keep their scripts in `waybar/` rather than moving them into `scripts/`.
- `waybar/codex-quota.sh` reads Codex quota from `~/.codex/sessions/**/*.jsonl` as a fallback, optionally from `~/.cache/codex/quota.json`, and falls back to Pi activity from `~/.pi/agent/sessions/**/*.jsonl` when exact quota data is unavailable; it displays the weekly Codex limit (`secondary`, 10080 minutes), marks expired quota data as stale, and should not hardcode tokens/secrets when extended.
- Use ASCII unless the target file already uses non-ASCII (some comments/docs are Spanish).
