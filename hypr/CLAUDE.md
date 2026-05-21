# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this directory is

Hyprland compositor configuration within a larger dotfiles repo at `~/.dotfiles`. The files here are symlinked to `~/.config/hypr/`.

## Applying changes

```bash
hyprctl reload          # reload hyprland.conf without restarting
hyprctl dispatch        # run a one-off dispatcher command
killall waybar && waybar &  # restart waybar after editing its config
```

Changes to `hypridle.conf` and `hyprlock.conf` take effect on the next invocation (no reload needed).

## File roles

| File | Purpose |
|------|---------|
| `hyprland.conf` | Main compositor config: monitors, autostart, keybinds, window rules |
| `hypridle.conf` | Idle timeouts: 5 min lock → 10 min screen off → 30 min suspend |
| `hyprlock.conf` | Lock screen appearance |
| `wallpapers/` | Wallpaper assets used by `awww` at startup |

Scripts called from config live in `../scripts/`: `lock-session.sh` (hyprlock guard) and `power-menu.sh` (wofi power menu).

## Architecture decisions

**Modifier key**: `ALT` (`$mainMod`), not `SUPER`, to avoid conflicts with KDE-inherited env vars.

**Autostart stack**: polkit-kde → waybar → cliphist (text+image) → mako → awww (wallpaper daemon).

**Monitor layout**: dual-monitor setup with workspaces 1–5 pinned to `DVI-I-2` (vertical/right) and 6–10 to `DVI-I-1` (primary/center). Fallback `eDP-1` for laptop-only use.

**Visual theme**: E-Ink/sepia aesthetic — blur disabled, inactive opacity 0.97, sepia active border (`C6B089`), near-black inactive border, smooth but not bouncy animations.

**Window rules**: XWayland floating windows with no class/title get `no_focus` to fix drag issues. All apps have maximize suppressed.

## Keybinding patterns

- `ALT + hjkl` — focus movement (Zellij-style)
- `ALT + SHIFT + h/l` — previous/next workspace
- `ALT + number` — go to workspace
- `ALT + CTRL + hjkl` — media/volume (j/k = vol down/up, h/l = prev/next track)
- `ALT + M` — microphone mute toggle
- `ALT + S` / `ALT + SHIFT + S` — screenshot to clipboard / screenshot to file

## IDEAS.md

Unimplemented ideas are tracked in `IDEAS.md` (scratchpad binding, OSD for volume/brightness, full-screen screenshot, Waybar restart bind, etc.). Consult it before adding new binds to avoid collisions.
