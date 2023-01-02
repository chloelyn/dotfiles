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
      
      eval "$(direnv hook zsh)"
    '';

    profileExtra = ''
      SHELL_SESSIONS_DISABLE=1
    '';

    shellAliases = {
      # https://github.com/ibraheemdev/modern-unix
      cat = "bat";
      ls = "exa";
      du = "dust";

      # Home-manager
      hms = "cd ~/.config/nixpkgs && home-manager switch --flake '.#aly'";
      hme = "cd ~/.config/nixpkgs && hx home.nix";

      # Wrapped helix
      hx = "helix-wrapped";

      # Nix
      ncd = "nix-collect-garbage -d";

      # Tailscale
      tailscale = "/Applications/Tailscale.app/Contents/MacOS/Tailscale";

      # Misc
      dev = "cd ~/Documents/personal/projects.nosync";
      digi = "cd ~/Documents/school/11th/digi";
      ip = "dig -4 TXT +short o-o.myaddr.l.gooole.com @ns1.google.com";
      path = ''python3 -c "import os; path: str = os.popen (\"echo $PATH\").read().strip(); print('\n'.join(path.split(':')));" '';
    };

    history = { path = "${config.xdg.dataHome}/zsh/zsh_history"; };

    oh-my-zsh = {
      enable = true;
      theme = "norm";

      plugins = [ "git" ];
    };
  };
}
