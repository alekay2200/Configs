# ZSH MacOS
Configuracion de la zsh para MacOS

escribir en el fichero **.zshrc**
```console
PROMPT='%B%F{51}%n@%f%b %1~ $ '
RPROMPT="%F{111}[%D{%f/%m/%y}|%@]"

export CLICOLOR=1
export LSCOLORS=exfxcxdxbxegedabagacad
```

# ZSH Autocompletion plugin

Clonar el repositorio donde quieras guardarlo
```console
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git
```

Eliminar cualquier llamda a **```compinit```** en tu fichero **```.zshrc```**.

Añadir al principio del fichero ```.zshrc``` la siguiente linea (antes de cualquier llamada a compdef)
```console
zsh source ~/{repo-location}/zsh-autocomplete/zsh-autocomplete.plugin.zsh
```

Comando mas utilizados por mi

| Keys  | Command | Info |
|-------|---------|------|
|```Control+P``` | Command history | Shows recently commandd used
