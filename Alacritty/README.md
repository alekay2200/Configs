# Terminal Alacritty

## Configuracion base
Crear carpeta de configuracion para alacritty.
```console
mkdir -p ~/.config/alacritty
cd ~/.config/alacritty
```

Copiar archivo de configuracion **alacritty.yml**.

Clonar repositorio de temas para alacritty.
```console
mkdir -p ~/.config/alacritty/themes
git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes
```

Temas disponibles en [https://github.com/alacritty/alacritty-theme](https://github.com/alacritty/alacritty-theme)

## Colores salida de comandos
En el caso de que comandos como "ls" muestren la salida sin ningun tipo de coloreado, añadir la siguiente linea en el fichero **.zshrc**

```console
alias ls="ls -G"
```