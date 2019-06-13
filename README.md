# NixOS Configuration

## Start

Clone the repository under home:

```
git clone https://github.com/CristhianMotoche/nixos-config.git -O ~/.nixos-config/
```

Link the [configuration.nix][config] file with `/etc/nixos`:

```
sudo ln -s ~/.nixos-config/pc/configuration.nix  /etc/nixos/
```

Apply changes:

```
sudo nixos-rebuild switch
```

[config]: ./configuration.nix
