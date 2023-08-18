# NVIM

## Requirements

- https://github.com/junegunn/vim-plug

Once you have nvim installed and the configuration copied, open an empty nvim window and execute the command to install all the plugins:
```console
PlugInstall
```

### Rust

- rust-analyzer
- nvim-lspconfig
- ``dot`` from ``graphviz`` (only for crate graph)

### Resolve git prompt error when cloning

Add this line into ``~/.ssh/config`` file

```console
Host github
    Hostname github.com
    User git
    IdentityFile ~/.ssh/PRIVATE_KEYFILE_NAME
```
