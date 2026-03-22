
# ==========
# 1) Historial
# ==========
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY   # guarda en el archivo en cuanto ejecutas

# ==========
# 2) Completado (TAB)
# ==========
autoload -Uz compinit
compinit

# Menú con flechas al completar
zstyle ':completion:*' menu select

# Completar sin importar mayúsculas/minúsculas
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# ==========
# 3) Comodidades
# ==========
setopt AUTO_CD           # escribir carpeta -> entra
setopt INTERACTIVE_COMMENTS  # permite comentarios en consola:  # esto es un comentario


# ==========
# 4) Prompt (Starship)
# ==========
eval "$(starship init zsh)"

# ==========
# 5) Plugins (Arch suele instalarlos aquí)
# ==========
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Syntax highlighting AL FINAL
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source ~/zsh-opencode-ai/zsh-opencode-ai.plugin.zsh

ai() {
  local cmd
  cmd="$(opencode run "You are a shell command generator. Only output the raw command, nothing else. Task: $*" 2>/dev/null)" || return
  cmd="${cmd//$'\r'/}"
  cmd="${cmd##[[:space:]]#}"
  cmd="${cmd%%[[:space:]]#}"
  print -z -- "$cmd"
}

export PATH="$HOME/.local/bin:$PATH"
