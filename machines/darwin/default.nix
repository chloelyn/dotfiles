{
  pkgs,
  lib,
  inputs,
  ...
}: let
  imported = builtins.map (x:
    import x {
      inherit pkgs;
      inherit inputs;
    });
  merge = lib.foldl (a: b: a // b) {};
in
  merge (imported [
    ./core.nix
    ./nix.nix
    ./system-defaults.nix
    ./env.nix
  ])
