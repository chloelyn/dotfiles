{ config, pkgs, ... }:

{
  home.sessionPath = [
    "/usr/local/bin"
    "${config.home.homeDirectory}/Library/pnpm"
    "${config.xdg.dataHome}/cargo/bin"
  ];

  home.sessionVariables = {
    NIX_PATH =
      "${config.home.homeDirectory}/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels";
    EDITOR = "${config.home.homeDirectory}/.nix-profile/bin/hx";
    ZSH_COMPDUMP = "${config.xdg.dataHome}/zsh/zcompdump";
    WAKATIME_HOME = "${config.home.homeDirectory}/.config/wakatime";
    PNPM_HOME = "${config.home.homeDirectory}/Library/pnpm";
    RUSTUP_HOME = "${config.xdg.dataHome}/rustup";
    CARGO_HOME = "${config.xdg.dataHome}/cargo";
    LESSHISTFILE = "-";
    BAT_THEME="Catppuccin-mocha";
  };
}
