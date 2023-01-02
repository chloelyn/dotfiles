{ config, pkgs, ... }:

{
  programs.helix = {
    enable = true;
    settings = {
      theme = "catppuccin_mocha";
      editor = {
        line-number = "relative";
        cursorline = true;
        bufferline = "always";
        color-modes = true;
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
        indent-guides = {
          render = true;
        };
      };
    };
    languages = [
      {
        auto-format = true;
        name = "nix";
        formatter = {
          command = "nixpkgs-fmt";
        };
        language-server = {
          command = "nil";
        };
      }
      {
        auto-format = true;
        name = "python";
        formatter = {
          command = "black";
          args = [ "--quiet" "-" ];
        };
      }
    ];
  };
}
