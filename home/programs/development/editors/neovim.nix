{ pkgs, ... }:
let neovim = (pkgs.buildFHSEnv {
  name = "nvim";
  targetPkgs = (
    pkgs: with pkgs; [
      stdenv.cc
      neovim-unwrapped
      unzip
      lua
      luarocks
      nodejs
      cargo

      tree-sitter

      wl-clipboard
    ]
  );
  runScript = "nvim";
});
in
  {

  home.packages = [
    neovim
    pkgs.lazygit
  ];
  programs.neovide = {
    enable = true;
    package = pkgs.neovide.override { inherit neovim; };
    settings = {
      maximized = true;
      font = {
        normal = [
          {
            family = "JetBrainsMono Nerd Font";
          }
        ];
        size = 12.0;
      };
      box-drawing = {
        mode = "native";
      };
    };
  };
}
