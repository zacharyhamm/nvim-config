-- Borland Turbo C++ lualine theme
-- Mimics the classic Borland IDE menu bar aesthetic

local c = {
  bg      = "#0000AA",
  bg_dark = "#000080",
  fg      = "#FFFF55",
  cyan    = "#00AAAA",
  green   = "#00AAAA",
  magenta = "#AA00AA",
  red     = "#AA0000",
  black   = "#000000",
  white   = "#FFFFFF",
  muted   = "#AAAAAA",
}

return {
  normal = {
    a = { fg = c.black, bg = c.cyan, gui = "bold" },
    b = { fg = c.fg, bg = c.bg_dark },
    c = { fg = c.muted, bg = c.bg },
  },
  insert = {
    a = { fg = c.black, bg = c.green, gui = "bold" },
    b = { fg = c.fg, bg = c.bg_dark },
    c = { fg = c.muted, bg = c.bg },
  },
  visual = {
    a = { fg = c.black, bg = c.magenta, gui = "bold" },
    b = { fg = c.fg, bg = c.bg_dark },
    c = { fg = c.muted, bg = c.bg },
  },
  replace = {
    a = { fg = c.black, bg = c.red, gui = "bold" },
    b = { fg = c.fg, bg = c.bg_dark },
    c = { fg = c.muted, bg = c.bg },
  },
  command = {
    a = { fg = c.black, bg = c.fg, gui = "bold" },
    b = { fg = c.fg, bg = c.bg_dark },
    c = { fg = c.muted, bg = c.bg },
  },
  inactive = {
    a = { fg = c.muted, bg = c.bg_dark },
    b = { fg = c.muted, bg = c.bg_dark },
    c = { fg = c.muted, bg = c.bg },
  },
}
