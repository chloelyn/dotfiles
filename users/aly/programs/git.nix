{pkgs, ...}:
# Git configuration
{
  programs.git = {
    enable = true;
    userName = "Alaina";
    userEmail = "68250402+alaidriel@users.noreply.github.com";
    signing = {
      key = "18F71B0A";
      signByDefault = true;
      gpgPath = "${pkgs.gnupg}/bin/gpg2";
    };
    ignores = [".DS_Store"];
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
    };
  };
}
