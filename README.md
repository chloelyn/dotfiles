# nix-config

My [nix-darwin](https://github.com/LnL7/nix-darwin) and [home-manager](https://github.com/nix-community/home-manager) configuration, in one flake!

## Installation

A working installation of both [nix](https://nixos.org/download.html) and [nix-darwin](https://github.com/LnL7/nix-darwin) are required.

```sh
git clone git@github.com:chloelyn/nix-config.git
mv nix-config ~/.config/nixpkgs
darwin-rebuild switch --flake ~/.config/nixpkgs
```

Subsequent changes to the configuration files can be applied using `nix-switch`.

## Updates

1. Recreate the `flake.lock`, updating all inputs

```sh
nix flake update
```

2. Rebuild the system configuration (and home-manager configuration) using the updated inputs

```sh
nix-switch
```
