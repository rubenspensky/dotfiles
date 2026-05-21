hl.config({
    general = {
        gaps_in  = 4,
        gaps_out = 10,
        border_size = 2,
        col = {
            active_border   = "rgba(C6B089CC)",
            inactive_border = "rgba(1A1F24CC)",
        },
        resize_on_border = false,
        allow_tearing    = false,
        layout           = "dwindle",
    },

    decoration = {
        rounding         = 8,
        rounding_power   = 2,
        active_opacity   = 1.0,
        inactive_opacity = 0.97,
        shadow = {
            enabled      = true,
            range        = 18,
            render_power = 2,
            color        = "rgba(00000066)",
        },
        blur = {
            enabled  = false,
            size     = 2,
            passes   = 1,
            vibrancy = 0.0,
        },
    },

    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo   = true,
    },
})
