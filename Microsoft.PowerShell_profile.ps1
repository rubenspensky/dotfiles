
# ─── STARSHIP PROMPT ─────────────────────────────────────────────────────────
Invoke-Expression (&starship init powershell)

# ─── HISTORIAL PERSISTENTE Y MEJORAS VISUALES ───────────────────────────────
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -Colors @{ "Prediction" = 'DarkGray' }
Set-PSReadLineKeyHandler -Key RightArrow -Function AcceptNextSuggestionWord

# ─── FZF INTEGRACIÓN ─────────────────────────────────────────────────────────
# Buscar archivos
function fzf-select {
  Get-ChildItem -Recurse | Where-Object {!$_.PSIsContainer} | ForEach-Object FullName | fzf
}

# Buscar en historial de comandos
function fzf-history {
  Get-History | ForEach-Object CommandLine | fzf
}

# ─── ZOXIDE ───────────────────────────────────────────────────────────────────
# Navegación rápida por carpetas
Invoke-Expression (&zoxide init powershell)

# ─── ALIAS UTILES ─────────────────────────────────────────────────────────────
# Evitar conflictos con alias protegidos
if (-not (Test-Path alias:cat)) { Set-Alias cat bat }
if (-not (Test-Path alias:ls)) { Set-Alias ls lsd }
if (-not (Test-Path alias:ll)) { Set-Alias ll "ls -l" }
if (-not (Test-Path alias:cls)) { Set-Alias cls Clear-Host }

Set-Alias vi nvim
Set-Alias vim nvim
Set-Alias code "code-insiders"
Set-Alias reload-profile ". $PROFILE"

# ─── PRIVACIDAD ───────────────────────────────────────────────────────────────
# Desactiva telemetría en PowerShell moderno (7+)
$env:POWERSHELL_TELEMETRY_OPTOUT = "1"

