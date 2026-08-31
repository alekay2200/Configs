# source ~/Programs/zsh-autocomplete/zsh-autocomplete.plugin.zsh

PROMPT='%B%F{51}%n@%f%b %1~ $ '
RPROMPT="%F{111}[%D{%f/%m/%y}|%T]"

# LLVM
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

export LDFLAGS="-L/opt/homebrew/opt/openssl@3/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openssl@3/include"

export CLICOLOR=1
export LSCOLORS=exfxcxdxbxegedabagacad

# lazygit: use ~/.config/lazygit instead of the macOS-only default path,
# so this config is portable to Linux/Windows too.
export CONFIG_DIR="$HOME/.config/lazygit"

export PATH=$PATH:/Users/alejandropalominogomez/Programs/helix
export PATH="$PATH:/opt/homebrew/Cellar/llvm/19.1.6/bin"
export PATH=$PATH:/Users/alejandropalominogomez/Programs/go/bin
export PATH=$PATH:/Users/alejandropalominogomez/Library/Python/3.9/bin
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH=$PATH:/Users/alejandropalominogomez/Programs/SQLite
export PATH=$PATH:/Users/alejandropalominogomez/Programs/nvim/bin
export PATH=$PATH:/Users/alejandropalominogomez/Programs/node/bin
export PATH=$PATH:/opt/homebrew/bin
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"
export LIBCLANG_PATH=/Library/Developer/CommandLineTools/usr/lib/libclang.dylib

# Java
export JAVA_HOME="/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home"

# Android 
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/platform-tools"

# Starship prompt
eval "$(starship init zsh)"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/alejandropalominogomez/.lmstudio/bin"
# End of LM Studio CLI section

