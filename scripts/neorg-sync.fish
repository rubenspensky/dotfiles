#!/usr/bin/env fish

# Configuración fija
set NEORG_DIR "$HOME/notas"
set REPO_URL "git@github.com:RubensVF/notes.git" # Ajusta esto a tu repo

# Función para sincronizar un archivo específico
function sync_file
    set file $argv[1]
    cd $NEORG_DIR

    git fetch origin main
    git reset --hard origin/main
    git pull --force

    git add $file
    git commit -m "Update "(basename $file) --no-verify || true
    git push --force
end

# Función para monitorear cambios
function watch_changes
    cd $NEORG_DIR

    while true
        inotifywait -e modify,create,delete -r --format '%w%f' $NEORG_DIR | while read -l file
            if not string match -q "*/.git/*" $file; and not string match -q "*~" $file; and not string match -q "*.swp" $file
                sleep 1
                sync_file (string replace "$NEORG_DIR/" "" $file)
            end
        end
    end
end

# Función de configuración inicial
function setup_sync
    # Verificar inotify-tools
    if not command -v inotifywait >/dev/null
        echo "Necesitas instalar inotify-tools:"
        echo "Ubuntu/Debian: sudo apt-get install inotify-tools"
        echo "Fedora: sudo dnf install inotify-tools"
        echo "Arch: sudo pacman -S inotify-tools"
        return 1
    end

    # Clonar o actualizar repo
    if test -d $NEORG_DIR
        echo "Actualizando repo existente..."
        cd $NEORG_DIR
        git pull
    else
        echo "Clonando repo..."
        git clone $REPO_URL $NEORG_DIR
    end

    # Configurar servicio systemd
    mkdir -p "$HOME/.config/systemd/user"
    echo "[Unit]
Description=Neorg Git Sync Service
After=network.target

[Service]
Type=simple
ExecStart=$HOME/.dotfiles/scripts/neorg-sync.fish watch
Restart=always
RestartSec=5

[Install]
WantedBy=default.target" >"$HOME/.config/systemd/user/neorg-sync.service"

    # Recargar y habilitar servicio
    systemctl --user daemon-reload
    systemctl --user enable neorg-sync
    systemctl --user restart neorg-sync

    echo "Configuración completada. El servicio está activo y configurado para inicio automático."
end

# Manejo de argumentos
switch $argv[1]
    case --setup
        setup_sync
    case watch
        watch_changes
    case '*'
        echo "Uso: "(status current-filename)" --setup|watch"
        exit 1
end
