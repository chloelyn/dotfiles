{
  pkgs,
  inputs,
  ...
}: {
  services.nix-daemon.enable = true;

  nix.package = pkgs.nix;
  nix.settings.auto-optimise-store = true;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  nixpkgs.overlays = with inputs; [
    rust-overlay.overlays.default
    personal.overlays.default
  ];
}
