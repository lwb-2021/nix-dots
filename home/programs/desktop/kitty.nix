{ config, lib, pkgs, ... }: {
  programs.kitty = {
    enable = true;
    settings = {
      
    };
    themeFile = "JetBrains_Darcula";
  };
}
