{
  config,
  pkgs,
  ...
}: {
  config.home.file = {
    ".config/btop" = {source = ./btop;};
    ".config/neofetch" = {source = ./neofetch;};
    ".config/helix" = {source = ./helix;};
    "Library/Application Support/zls.json" = {
      text = ''
        {
          "zig_lib_path": "${pkgs.zig-custom}/lib",
          "enable_snippets": true,
          "warn_style": true,
          "enable_semantic_tokens": true,
          "operator_completions": true,
          "include_at_in_builtins": true,
          "max_detail_length": 1048576
        }
      '';
    };
  };
}
