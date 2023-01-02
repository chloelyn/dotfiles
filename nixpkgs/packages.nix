{ config, pkgs, ... }:

{
  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # Shell
    oh-my-zsh
    neofetch

    # Tools
    bat
    exa
    fd
    du-dust
    ripgrep
    helix

    # Git
    gh
    git

    # Language support
    nodejs-18_x # Node
    python310 # Python
    rustup # Rust
    jdk17 # Java

    # Node extras
    nodePackages.pnpm
    nodePackages.prettier
    nodePackages.typescript
  ];
}
