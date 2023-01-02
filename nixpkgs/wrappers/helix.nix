{ stdenv, lib, runCommandNoCC, helix, rust-analyzer, rnix-lsp, python39Packages, makeWrapper, ... }:

runCommandNoCC "helix" { nativeBuildInputs = [ makeWrapper ]; } ''
  mkdir -p $out/bin
  makeWrapper ${helix}/bin/hx $out/bin/hx \
    --prefix PATH : ${lib.makeBinPath [ rust-analyzer rnix-lsp python39Packages.python-lsp-server ]}
''
