# Git configuration
{
  programs.git = {
    enable = true;
    userName = "Alaina Newmark";
    userEmail = "68250402+alaidriel@users.noreply.github.com";
    signing = {
      key = "37BA3AE5";
      signByDefault = true;
      gpgPath = "/usr/local/bin/gpg";
    };
    ignores = [ ".DS_Store" ];
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
    };
  };
}
