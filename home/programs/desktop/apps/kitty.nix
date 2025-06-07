{ config, lib, pkgs, ... }: {
  programs.kitty = {
    enable = true;
    settings = {
      cursor_trail = 3;     
    };
    themeFile = "JetBrains_Darcula";
  };
}
