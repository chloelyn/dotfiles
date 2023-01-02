{ config, pkgs, ... }:

{
  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # Shell
    oh-my-zsh

    # Tools
    bat
    exa
    fd
    du-dust
    ripgrep
    tldr
    btop
    neofetch
    direnv

    # Git
    gh
    git

    # Language support
    nodejs-18_x
    python310
    rustup
    jdk17

    # Node extras
    nodePackages.pnpm
    nodePackages.prettier
    nodePackages.typescript

    # Python extras
    black

    # Wrappers
    (runCommandNoCC "helix-wrapped" { nativeBuildInputs = [ makeWrapper ]; } ''
      mkdir -p $out/bin
      makeWrapper ${helix}/bin/hx $out/bin/helix-wrapped \
        --prefix PATH : ${lib.makeBinPath [ rust-analyzer rnix-lsp python39Packages.python-lsp-server ]}
    ''
    )
  ];
}
