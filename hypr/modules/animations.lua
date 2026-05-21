hl.config({ animations = { enabled = true } })

hl.curve("smooth", { type = "bezier", points = { {0.22, 1}, {0.36, 1} } })
hl.curve("quick",  { type = "bezier", points = { {0.2,  0}, {0.1,  1} } })
hl.curve("linear", { type = "bezier", points = { {0,    0}, {1,    1} } })

hl.animation({ leaf = "global",     enabled = true, speed = 7, bezier = "smooth" })
hl.animation({ leaf = "border",     enabled = true, speed = 6, bezier = "smooth" })
hl.animation({ leaf = "windows",    enabled = true, speed = 6, bezier = "smooth" })
hl.animation({ leaf = "windowsIn",  enabled = true, speed = 6, bezier = "smooth" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 5, bezier = "smooth" })
hl.animation({ leaf = "fade",       enabled = true, speed = 5, bezier = "quick"  })
hl.animation({ leaf = "layers",     enabled = true, speed = 6, bezier = "smooth" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 5, bezier = "quick"  })
