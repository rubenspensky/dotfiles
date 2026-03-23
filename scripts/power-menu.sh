#!/usr/bin/env sh

lock_cmd="$HOME/.dotfiles/scripts/lock-session.sh"

choice=$(
  printf '%s\n' "Bloquear" "Suspender" "Cerrar sesion" "Reiniciar" "Apagar" |
    wofi --dmenu --prompt "Energia"
)

case "$choice" in
  "Bloquear")
    exec "$lock_cmd"
    ;;
  "Suspender")
    "$lock_cmd"
    exec systemctl suspend
    ;;
  "Cerrar sesion")
    exec hyprctl dispatch exit
    ;;
  "Reiniciar")
    exec systemctl reboot
    ;;
  "Apagar")
    exec systemctl poweroff
    ;;
esac
