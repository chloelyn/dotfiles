{ config
, lib
, pkgs
, runCommandNoCC
, makeWrapper
, helix
, rust-analyzer
, nil
, nixpkgs-fmt
, python39Packages
, ...
}:

runCommandNoCC "helix-wrapped"
{
  nativeBuildInputs = [ makeWrapper ];
} ''
  mkdir -p $out/bin
  makeWrapper ${helix}/bin/hx $out/bin/helix-wrapped \
    --prefix PATH : ${lib.makeBinPath [
      rust-analyzer
      nil
      python39Packages.python-lsp-server
      nixpkgs-fmt
  ]}
''
