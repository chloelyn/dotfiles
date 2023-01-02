{ config, pkgs, ... }:

{
  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # Shell
    starship
    direnv

    # Tools
    bat
    exa
    fd
    du-dust
    ripgrep
    tldr
    btop

    # Git
    gh
    git

    # Language support
    nodejs-18_x
    python310
    rustup
    jdk17
    haskell.compiler.ghc924

    # Node extras
    nodePackages.pnpm
    nodePackages.prettier
    nodePackages.typescript

    # Python extras
    black

    # Wrappers
    (callPackage ./wrappers/helix.nix { })
  ];
}
