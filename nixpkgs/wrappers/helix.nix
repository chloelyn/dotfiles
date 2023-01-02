{ config, pkgs, ... }:

runCommandNoCC "helix-wrapped" { nativeBuildInputs = [ makeWrapper ]; } ''
  mkdir -p $out/bin
  makeWrapper ${helix}/bin/hx $out/bin/helix-wrapped \
    --prefix PATH : ${lib.makeBinPath [
      rust-analyzer 
      rnix-lsp
      python39Packages.python-lsp-server
      haskell-language-server.override {
        supportedGhcVersions = [ "942" ];
      }
    ]}
''
