{ config
, lib
, pkgs
, runCommandNoCC
, makeWrapper
, helix
, rust-analyzer
, rnix-lsp
, python39Packages
, haskell-language-server
, haskellPackages
, ...
}:

let
  hls = haskell-language-server.override {
    supportedGhcVersions = [ "924" ];
  };
in
runCommandNoCC "helix-wrapped"
{
  nativeBuildInputs = [ makeWrapper ];
} ''
  mkdir -p $out/bin
  makeWrapper ${helix}/bin/hx $out/bin/helix-wrapped \
    --prefix PATH : ${lib.makeBinPath [
      rust-analyzer
      rnix-lsp
      python39Packages.python-lsp-server
      hls
      haskellPackages.hindent
  ]}
''
