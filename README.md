# gnome.nvim

GNOME + Neovim

## Features

- [x] Color picker
- [ ] Input prompt
- [ ] Notification popup
- [ ] Panel status

## Installation

Using [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
-- gnome.lua
return {
  "luckasRanarison/gnome.nvim",
  opts = {}
}
```

## Configuration

Default configuration:

```lua
---@type Gnome.Option
local default = {
  color_dialog = {
    gtk = "v4" -- "v3" | "v4"
    default_format = "hex", -- "rgb" | "rgba" | "hex" | "HEX" | "hexa" | "HEXA"
  },
}
```

## Commands

Available commands:

- `GnomeColor [rgb | rgba | hex | HEX | hexa | HEXA]`: Opens a GTK color dialog and inserts the selected color at the current cursor position.
