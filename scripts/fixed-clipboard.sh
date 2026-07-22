#!/usr/bin/env sh

values_file="$HOME/.dotfiles/scripts/fixed-clipboard.txt"

choice=$(
  sed '/^[[:space:]]*#/d; /^[[:space:]]*$/d' "$values_file" |
    wofi --dmenu --prompt "Clipboard fijo"
)

[ -n "$choice" ] || exit 0

printf '%s' "$choice" | wl-copy
notify-send "Clipboard" "Valor copiado"
