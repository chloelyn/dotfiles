{
  config,
  pkgs,
  ...
}: {
  home.sessionPath = [
    "/usr/local/bin"
    "${config.xdg.dataHome}/cargo/bin"
  ];

  home.sessionVariables = {
    NIX_PATH = "${config.home.homeDirectory}/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels";
    EDITOR = "/etc/profiles/per-user/aly/bin/hx";
    ZSH_COMPDUMP = "${config.xdg.dataHome}/zsh/zcompdump";
    WAKATIME_HOME = "${config.home.homeDirectory}/.config/wakatime";
    CARGO_HOME = "${config.xdg.dataHome}/cargo";
    LESSHISTFILE = "-";
  };
}
