# gnome.nvim

GNOME + Neovim

## Features

- [x] Color picker
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
---@class GnomeUI.Option
M.options = {
  color_dialog = {
    default_format = "hex", -- rgb | rgba | hex | HEX
  },
}
```

## Commands

Available commands:

- `GnomeColor [rgb | rgba | hex | HEX]`: Opens a GTK color dialog and inserts the selected color at the current cursor position.
