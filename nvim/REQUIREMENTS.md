# Requirements

This document lists the packages needed for this Neovim + Zsh setup based on the current dotfiles.

## Base
- neovim
- git
- nodejs
- npm
- ripgrep (recommended)
- fd (recommended)
- wl-clipboard (Wayland) or xclip/xsel (X11) for clipboard integration

## Neovim - Plugins and Tools
- prettier (used by Conform)
- curl (used by kulala.nvim)

## Language Extras (LazyVim imports)

### TypeScript / JavaScript
- typescript
- typescript-language-server
- prettier
- eslint (optional)
- eslint_d (optional)

### JSON / YAML
- vscode-langservers-extracted (json-lsp, css-lsp)
- yaml-language-server
- prettier

### Docker
- dockerfile-language-server-nodejs
- docker-compose-language-service
- hadolint (optional)

### SQL
- sqls or sql-language-server
- sql-formatter (optional)

### Go
- go
- gopls
- goimports
- golangci-lint (optional)

### Python
- python3
- pyright
- ruff (recommended)
- black (optional)

### Java
- jdk (openjdk or temurin)
- jdtls
- google-java-format (optional)

### Markdown
- marksman
- prettier

## Zsh
- zsh
- starship
- zsh-autosuggestions
- zsh-syntax-highlighting
- opencode CLI
- zsh-opencode-ai plugin (local clone at ~/zsh-opencode-ai)
