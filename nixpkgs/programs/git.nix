# Git configuration
{
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
}
