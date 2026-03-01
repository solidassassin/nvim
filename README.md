# My NeoVim config

## ATTENTION

This configuration is outdated and not in use anymore. The new configuration utilizes NixVim and can be found [here](https://github.com/solidassassin/nvim-flake).

## Requirements

- [NeoVim 0.5+](https://github.com/neovim/neovim/wiki/Installing-Neovim)
- [paq-nvim](https://github.com/savq/paq-nvim#installation)

## Setup

```sh
git clone https://github.com/solidassassin/nvim.git $HOME/.config/
```

### Cache directory

This configuration saves the backups and undo history in the `.cache` folder.
To create the used folder structure just run this in the root of the `nvim` folder:

```sh
mkdir -p $HOME/.cache/nvim/{backups,undo}
```

### Extensions

Just run the command bellow once nvim is open:

```vim
:PaqInstall
```

### Language servers

Each language server used requires to be installed.
[This guide](https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md) will help you do so.
