{ pkgs, ... }:
let
  neovim = (
    pkgs.buildFHSEnv {
      name = "nvim";
      targetPkgs = (
        pkgs: with pkgs; [
          stdenv.cc

          systemdLibs
          libinput
          libgbm
          fontconfig
          freetype

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
    }
  );
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
      box-drawing = {
        mode = "native";
      };
    };
  };
  xdg.mimeApps.defaultApplications = {
    "text/plain" = "neovide.desktop";
    "text/markdown" = "neovide.desktop";
  };
}
