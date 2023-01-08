{
  config,
  lib,
  pkgs,
  runCommandNoCC,
  makeWrapper,
  helix,
  rust-analyzer,
  nil,
  alejandra,
  python39Packages,
  black,
  zls,
  ...
}:
runCommandNoCC "hx"
{
  nativeBuildInputs = [makeWrapper];
} ''
  mkdir -p $out/bin
  makeWrapper ${helix}/bin/hx $out/bin/hx \
    --prefix PATH : ${lib.makeBinPath [
    rust-analyzer
    nil
    python39Packages.python-lsp-server
    black
    alejandra
    zls
  ]}
''
