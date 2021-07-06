# My NeoVim config

**NOTE:** This config is created for Unix systems and would require some
modifications to work on Windows.

## Requirements

- [NeoVim 0.5+](https://github.com/neovim/neovim/wiki/Installing-Neovim)
- [paq-nvim](https://github.com/savq/paq-nvim#installation)

## Setup

```sh
➜ git clone https://github.com/solidassassin/nvim.git
```

### Cache directory

This configuration saves the backups and undo history in the `.cache` folder.
To create the used folder structure just run this in the root of the `nvim` folder:

```sh
➜ mkdir -p .cache/{backups, undo}
```

### Extensions

Just run the command bellow once nvim is open:

```vim
:PaqInstall
```

### Language servers

Each language server used requires to be installed.
[This guide](https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md) will help you do so.
