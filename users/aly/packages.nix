{pkgs, ...}: let
  rust-stable = pkgs.rust-bin.stable.latest.default.override {
    extensions = ["rust-src"];
  };
in {
  home.packages = with pkgs; [
    rust-stable
    gh

    # Personal projects
    etherea
    athena

    # Wrappers
    (callPackage ./wrappers/helix.nix {})
  ];
}
