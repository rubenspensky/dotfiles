set -Ux PATH $PATH $HOME/go/bin
if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Añade estas líneas al final del archivo
if test -d "/home/linuxbrew/.linuxbrew/opt/mysql-client/bin"
    fish_add_path /home/linuxbrew/.linuxbrew/opt/mysql-client/bin
    set -gx LDFLAGS "-L/home/linuxbrew/.linuxbrew/opt/mysql-client/lib"
    set -gx CPPFLAGS "-I/home/linuxbrew/.linuxbrew/opt/mysql-client/include"
    set -gx PKG_CONFIG_PATH "/home/linuxbrew/.linuxbrew/opt/mysql-client/lib/pkgconfig"
end

set -gx PATH /home/linuxbrew/.linuxbrew/bin /home/linuxbrew/.linuxbrew/sbin $PATH
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
set -gx PATH /home/linuxbrew/.linuxbrew/opt/lua/bin /home/linuxbrew/.linuxbrew/opt/luarocks/bin $PATH

if type -q fnm
    fnm env --use-on-cd | source
end
# ~/.config/fish/config.fish

# Define los colores
set -g fish_color_normal normal
set -g fish_color_command 5fd7ff
set -g fish_color_comment 808080
set -g fish_color_keyword 00afff
set -g fish_color_quote ffffff
set -g fish_color_redirection 5fd7ff
set -g fish_color_end 5fd7ff
set -g fish_color_error ff005f
set -g fish_color_param ffffff
set -g fish_color_selection --background=brblack --foreground=white
set -g fish_color_search_match --background=white --foreground=brblack
set -g fish_color_operator 00afff
set -g fish_color_escape 00afff
set -g fish_color_cwd green
set -g fish_color_cwd_root red
set -g fish_color_valid_path --underline
set -g fish_color_autosuggestion 808080
set -g fish_color_user brblue
set -g fish_color_host normal
set -g fish_color_cancel -r

if not set -q ZELLIJ
    zellij
end
