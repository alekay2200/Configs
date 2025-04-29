# Configs

Repositorio para guardar las configuraciones de mis programas

## TODO
- Include the new font (see macos)
- Include install ripgrep (necesary for find text in files, <super>fg)
- Update nvim config because two bugs was solved
- Solve and document problem with kitty tabs
- In Linux create alias ls > ls --color=auto para que funcionen los colores que tengo en la carpeta zsh
- Include installation of termicons (needed for kitty)
- Incluir env variable export LIBGL_ALWAYS_SOFTWARE=1 (zshrc) si estoy en maquina virtual y kitty no se lanza. Para asegurar que el vm carga el zshrc, poner en .zprofile esto: source ~/.zshrc
- Qtile autostart, run script on startup
- Install xclip en arch para tener soporte de nvim con el clipboard
- nitrogen for wallpapers
- picom for transparency

## Install Nerd fonts (our update)
[fonts](https://gist.github.com/davidteren/898f2dcccd42d9f8680ec69a3a5d350e)

```console
bew install --cask font-caskaydia-cove-nerd-font
```

## Spectre plugin for neovim dependencies (Only MacOS)
```console
brew install gnu-sed
```

## Install lazygit
```console
brew install lazygit
```

Run debugger on cargo project
- Set breakpoint <leader>db
- go to main <leader>k and select debug

Run debugger for go and python
- Set breakpoint <leader>db
- start debuggin <leader>dc

### Lazygit themes
[catppuccin](https://github.com/catppuccin/lazygit/tree/main)

### Configure python envs
Create a virtual env
```console
virtualenv new_env
```

In the root of the environmet create ``pyrightconfig.json`` file with the following content:
```json
{
  "venvPath": "./bin/python"
}
```
