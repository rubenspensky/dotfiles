# Path y Variables de Entorno Básicas
# ------------------------------
set -Ux PATH $PATH $HOME/go/bin
set -gx PATH /home/linuxbrew/.linuxbrew/bin /home/linuxbrew/.linuxbrew/sbin $PATH
set --export PATH $HOME/.bun/bin $PATH
set -gx PATH $HOME/bin $PATH
# Configuración de Homebrew
# ------------------------------
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)

# Configuración Interactiva
# ------------------------------
if status is-interactive
    # Aquí puedes poner:
    # - Aliases
    # - Funciones interactivas
    # - Configuración del prompt
    # - Atajos de teclado
end

# Configuración de Herramientas de Desarrollo
# ------------------------------
# MySQL Client
if test -d "/home/linuxbrew/.linuxbrew/opt/mysql-client/bin"
    fish_add_path /home/linuxbrew/.linuxbrew/opt/mysql-client/bin
    set -gx LDFLAGS "-L/home/linuxbrew/.linuxbrew/opt/mysql-client/lib"
    set -gx CPPFLAGS "-I/home/linuxbrew/.linuxbrew/opt/mysql-client/include"
    set -gx PKG_CONFIG_PATH "/home/linuxbrew/.linuxbrew/opt/mysql-client/lib/pkgconfig"
end

# Lua y LuaRocks
set -gx PATH /home/linuxbrew/.linuxbrew/opt/lua/bin /home/linuxbrew/.linuxbrew/opt/luarocks/bin $PATH

# Node Version Manager (fnm)
if type -q fnm
    fnm env --use-on-cd | source
end

# Terminal Multiplexer (Zellij)
# ------------------------------
if not set -q ZELLIJ
    zellij
end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
