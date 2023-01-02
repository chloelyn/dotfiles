{ config, pkgs, ... }:

{
  # Zsh configuration
  programs.zsh = {
    enable = true;
    autocd = true;
    enableSyntaxHighlighting = true;
    initExtra = ''
      # Configure Nix
      if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
        . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
      fi
    '';

    profileExtra = ''
      SHELL_SESSIONS_DISABLE=1
    '';

    shellAliases = {
      # https://github.com/ibraheemdev/modern-unix
      cat = "bat";
      ls = "exa";
      du = "dust";
      find = "find";

      # Nix
      nix-switch = "darwin-rebuild switch --flake ~/.config/nixpkgs";
      nix-edit = "cd ~/.config/nixpkgs && hx .";
      nix-clean = "nix-collect-garbage -d";

      # Wrapped helix
      hx = "helix-wrapped";

      # Tailscale
      tailscale = "/Applications/Tailscale.app/Contents/MacOS/Tailscale";

      # Misc
      dev = "cd ~/Documents/personal/projects.nosync";
      digi = "cd ~/Documents/school/11th/digi";
      ip = "dig -4 TXT +short o-o.myaddr.l.gooole.com @ns1.google.com";
      path = ''python3 -c "import os; path: str = os.popen (\"echo $PATH\").read().strip(); print('\n'.join(path.split(':')));" '';
    };

    history = { path = "${config.xdg.dataHome}/zsh/zsh_history"; };
  };
}
