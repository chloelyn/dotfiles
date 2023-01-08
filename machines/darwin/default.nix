{
  pkgs,
  lib,
  ...
}: let
  imported = builtins.map (x: import x {inherit pkgs;});
  merge = lib.foldl (a: b: a // b) {};
in
  merge (imported [
    ./core.nix
    ./nix.nix
    ./system-defaults.nix
    ./env.nix
  ])
