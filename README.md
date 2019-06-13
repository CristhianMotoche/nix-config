# NixOS Configuration

## Start

Clone the repository under home:

```
git clone git@github.com:CristhianMotoche/nix-config.git ~/.nix-config/
```

Link the [configuration.nix][config] file with `/etc/nixos`:

```
sudo ln -s ~/.nix-config/pc/configuration.nix  /etc/nixos/
```

Apply changes:

```
sudo nixos-rebuild switch
```

[config]: ./configuration.nix
