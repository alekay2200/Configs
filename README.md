# Configs

Repositorio para guardar las configuraciones de mis programas

## Install Nerd fonts (our update)
[fonts](https://gist.github.com/davidteren/898f2dcccd42d9f8680ec69a3a5d350e)
```console
bew install --cask font-caskaydia-cove-nerd-font
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
