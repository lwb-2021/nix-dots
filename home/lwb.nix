{ config, pkgs, inputs,... }:{
  home.username = "lwb";
  home.homeDirectory = "/home/lwb";
  home.stateVersion = "25.05";
  xresources.properties = {
    "Xcursor.size" = 24;
    "Xft.dpi" = 154;
  };
  imports = [
    ./config/i18n.nix
    ./programs/apps.nix
    ./programs/code.nix
    ./programs/desktop
    ./programs/fonts.nix
    ./programs/kdeconnect.nix
    ./programs/minecraft.nix
    ./programs/media
    ./programs/themes.nix
    ./programs/rime.nix
    ./programs/rofi.nix
  ];
}
