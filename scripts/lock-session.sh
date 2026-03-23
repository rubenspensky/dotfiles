#!/usr/bin/env sh

if pgrep -x hyprlock >/dev/null 2>&1; then
  exit 0
fi

exec hyprlock
