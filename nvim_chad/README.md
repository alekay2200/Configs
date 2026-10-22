# Config de Neovim (NvChad v2.5)

NvChad se usa como plugin (`NvChad/NvChad`), asi que su configuracion se importa
con `require "nvchad.options"`, `require "nvchad.mappings"`, etc.

## Estructura

```
init.lua                      bootstrap de lazy.nvim y carga de config/
lua/
  chadrc.lua                  opciones de NvChad (tema, statusline)
  config/
    lazy.lua                  ajustes de lazy.nvim
    options.lua               vim.opt
    mappings.lua              todos los keymaps
    autocmds.lua              autocmds y comandos de usuario
    utils.lua                 funciones auxiliares propias
  plugins/                    un archivo por plugin: spec + su configuracion
```

Un plugin = un archivo. Cada `lua/plugins/<nombre>.lua` contiene la spec de lazy y
su configuracion inline, asi que todo lo que afecta a un plugin esta en un solo
sitio.

## Como anadir un plugin

Crea `lua/plugins/<nombre>.lua` que devuelva la spec de lazy. No hay que registrarlo
en ningun sitio: lazy importa automaticamente todo `lua/plugins/*.lua`.

```lua
-- Para que sirve este plugin
return {
  "autor/plugin.nvim",
  opts = {},
}
```

Si necesita logica (no solo una tabla de opciones), usa `config`:

```lua
return {
  "autor/plugin.nvim",
  config = function()
    require("plugin").setup { ... }
  end,
}
```

Los keymaps van en `lua/config/mappings.lua`, o en `keys = {}` dentro de la spec si
quieres que el plugin se cargue de forma diferida al pulsarlos.

## Como borrar un plugin

Borra `lua/plugins/<nombre>.lua`, sus keymaps en `lua/config/mappings.lua`, y
ejecuta `:Lazy clean`.

## Requisitos

- ripgrep
- rust-analyzer
- node (markdown-preview, swagger-preview)

# Credits

1) Lazyvim starter https://github.com/LazyVim/starter as nvchad's starter was inspired by Lazyvim's.
