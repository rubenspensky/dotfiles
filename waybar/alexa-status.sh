#!/bin/bash
# Reads ~/.cache/asistente/status.json and outputs Waybar JSON.
# Used by the custom/alexa module (interval: 1).

FILE="$HOME/.cache/asistente/status.json"

if [ ! -f "$FILE" ]; then
  echo '{"text":"","class":"offline","tooltip":"Alexa not running"}'
  exit 0
fi

python3 - "$FILE" <<'EOF'
import json, sys, pathlib

f = pathlib.Path(sys.argv[1])
try:
    d = json.loads(f.read_text())
    print(json.dumps({
        "text":    d["text"],
        "class":   d["state"],
        "tooltip": f"Alexa · {d['state']}"
    }))
except Exception:
    print('{"text":"","class":"offline","tooltip":"Alexa: read error"}')
EOF
