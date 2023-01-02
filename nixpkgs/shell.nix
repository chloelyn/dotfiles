{ pkgs ? import <nixpkgs> { } }:
pkgs.mkShell {
  nativeBuildInputs = with pkgs; [ rnix-lsp ];

  shellHook = ''
    hx ~/.config/nixpkgs/home.nix
  '';
}
