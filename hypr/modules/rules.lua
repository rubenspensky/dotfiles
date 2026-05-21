-- Workspaces 1-5 en DVI-I-2 (vertical/derecha), 6-10 en DVI-I-1 (principal)
hl.workspace_rule({ workspace = "1",  monitor = "DVI-I-2", default = true })
hl.workspace_rule({ workspace = "2",  monitor = "DVI-I-2" })
hl.workspace_rule({ workspace = "3",  monitor = "DVI-I-2" })
hl.workspace_rule({ workspace = "4",  monitor = "DVI-I-2" })
hl.workspace_rule({ workspace = "5",  monitor = "DVI-I-2" })
hl.workspace_rule({ workspace = "6",  monitor = "DVI-I-1", default = true })
hl.workspace_rule({ workspace = "7",  monitor = "DVI-I-1" })
hl.workspace_rule({ workspace = "8",  monitor = "DVI-I-1" })
hl.workspace_rule({ workspace = "9",  monitor = "DVI-I-1" })
hl.workspace_rule({ workspace = "10", monitor = "DVI-I-1" })

hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
    no_focus = true,
})

hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },
    move  = "20 monitor_h-120",
    float = true,
})
