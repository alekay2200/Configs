**This repo is supposed to used as config by NvChad users!**

- The main nvchad repo (NvChad/NvChad) is used as a plugin by this repo.
- So you just import its modules , like `require "nvchad.options" , require "nvchad.mappings"`
- So you can delete the .git from this repo ( when you clone it locally ) or fork it :)

# Credits

1) Lazyvim starter https://github.com/LazyVim/starter as nvchad's starter was inspired by Lazyvim's . It made a lot of things easier!

# Requirements
- ripgrep
- rust-analyzer

# MACOS
After installing disable quarantine
```console
xattr -r -d com.apple.quarantine ~/.local/share/nvim

# Path where nvim is installed
xattr -r -d com.apple.quarantine ~/Programs/nvim/lib/nvim
```
