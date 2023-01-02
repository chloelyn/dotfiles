{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "aly";
  home.homeDirectory = "/Users/aly";
  xdg.dataHome = "${config.home.homeDirectory}/.local/share";

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # Shell
    oh-my-zsh
    neofetch

    # Tools
    bat
    exa
    fd
    du-dust
    ripgrep
    neovim

    # Cloud CLIs
    railway
    flyctl
    doppler

    nodePackages.pnpm # Package manager for JS/TS
    nodePackages.prettier # Formatter

    # Git
    gh
    git

    # Language support
    nodejs-18_x # Node
    nodePackages.typescript # TypeScript
    python310 # Python
    rustup # Rust
    jdk17 # Java

    # Language servers
    # cmake-language-server # CMakeLists.txt (broken)
    nodePackages.dockerfile-language-server-nodejs # Dockerfile
    sumneko-lua-language-server # Lua
    nodePackages.vscode-langservers-extracted # HTML, CSS, Eslint, JSON, Markdown
    nodePackages.typescript-language-server # TypeScript
    rnix-lsp # Nix
    pyright # Python
    rust-analyzer # Rust

    # Formatters
    stylua
  ];

  home.sessionPath = [
    "/opt/local/bin"
    "opt/local/sbin"
    "${config.home.homeDirectory}/Library/pnpm"
    "${config.home.homeDirectory}/.cargo/bin"
  ];

  home.sessionVariables = {
    NIX_PATH =
      "${config.home.homeDirectory}/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels";
    EDITOR = "${config.home.homeDirectory}/.nix-profile/bin/nvim";
    ZSH_COMPDUMP = "${config.xdg.dataHome}/zsh/zcompdump";
    WAKATIME_HOME = "${config.home.homeDirectory}/.config/wakatime";
    PNPM_HOME = "${config.home.homeDirectory}/Library/pnpm";
  };

  # Git configuration
  programs.git = {
    enable = true;
    userName = "Alaina Newmark";
    userEmail = "68250402+chloelyn@users.noreply.github.com";
    signing = {
      key = "37BA3AE5";
      signByDefault = true;
      gpgPath = "/usr/local/bin/gpg";
    };
    ignores = [ ".DS_Store" ];
  };

  # SSH configuration
  programs.ssh = {
    enable = true;
    matchBlocks = {
      "github.com" = {
        extraOptions = {
          UseKeychain = "yes";
          AddKeysToAgent = "yes";
        };
        identityFile = "${config.xdg.dataHome}/ssh/id_ed25519";
      };
    };
  };

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

      # Neovim
      vim = "nvim";
      nv = "nvim";
      nvd = "neovide";

      # Home-manager
      hms = "home-manager switch";
      hme = "nvim ~/.config/nixpkgs/home.nix";

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

  # Bash configuration
  programs.bash = {
    enable = true;
    enableCompletion = false;
    shellOptions = [ ];
    historyFile = "${config.xdg.dataHome}/bash/bash_history";
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
