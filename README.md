# Configuración del Entorno de Desarrollo

## 1. Actualizar el sistema y paquetes básicos

```bash
sudo apt update
sudo apt upgrade -y
```

## 2. Instalar dependencias del sistema

```bash
sudo apt install build-essential gcc make cmake pkg-config curl git -y
```

## 3. Instalar Homebrew y sus dependencias

```bash
# Instalar Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Agregar Homebrew al PATH
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.profile
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Instalar paquetes necesarios para Homebrew
brew install gcc
```

## 4. Clonar dotfiles e instalar paquetes

```bash
# Clonar repositorio
git clone https://github.com/RubensVF/dotfiles.git ~/.dotfiles

# Instalar paquetes desde Brewfile
cd ~/.dotfiles
brew bundle
```

## 5. Configurar Fish como shell predeterminado

```bash
echo $(which fish) | sudo tee -a /etc/shells
chsh -s $(which fish)
```

## 5b. Configurar Zsh como shell predeterminado (opcional)

```bash
echo $(which zsh) | sudo tee -a /etc/shells
chsh -s $(which zsh)
```

## 6. Instalar Oh My Fish

```bash
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
```

## 7. Crear enlaces simbólicos

```bash
# Crear directorios de configuración si no existen
mkdir -p ~/.config/{fish,nvim,zellij}

# Crear enlaces simbólicos
ln -s ~/.dotfiles/fish ~/.config/fish
ln -s ~/.dotfiles/nvim ~/.config/nvim
ln -s ~/.dotfiles/zellij ~/.config/zellij
ln -s ~/.dotfiles/zsh/.zshrc ~/.zshrc
```

## 8. Instalar win32yank para clipboard en WSL2

```bash
# Descargar e instalar win32yank
curl -sLo/tmp/win32yank.zip https://github.com/equalsraf/win32yank/releases/download/v0.0.4/win32yank-x64.zip
unzip -p /tmp/win32yank.zip win32yank.exe > /tmp/win32yank.exe
chmod +x /tmp/win32yank.exe
sudo mv /tmp/win32yank.exe /usr/local/bin/
```

## Notas importantes

- Después de configurar Fish como shell predeterminado, necesitarás reiniciar la terminal
- Asegúrate de que no existan los directorios destino antes de crear los enlaces simbólicos
- Si los directorios ya existen, necesitarás eliminarlos primero:
  ```bash
  rm -rf ~/.config/fish ~/.config/nvim ~/.config/zellij
  ```
