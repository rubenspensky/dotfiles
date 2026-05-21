
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

export PATH="$HOME/.local/bin:$PATH"

eval $(luarocks --lua-version 5.1 path --bin)

alias ll='ls -la'   
alias leet='nvim -c "Neetcode"'

export EDITOR=nvim
export TERM=xterm-256color
export AWS_PROFILE=AdministratorAccess-705777572913

export PATH="$PATH:$(go env GOPATH)/bin"

# load local secrets automatically
if [ -f "$HOME/.env.local" ]; then
    source "$HOME/.env.local"
fi

# Better cd
eval "$(zoxide init zsh)"

# Fuzzy finder keybindings
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# Better history
eval "$(atuin init zsh)"

alias ls='eza --icons'
alias ll='eza -la --icons --git'
alias cat='bat'
alias grep='rg'
