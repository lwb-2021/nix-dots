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
    ./programs/desktop
    ./programs/media

    ./programs/apps.nix
    ./programs/aria2.nix
    ./programs/code.nix
    ./programs/fonts.nix
    ./programs/kdeconnect.nix
    ./programs/minecraft.nix
    ./programs/rime.nix
    ./programs/rofi.nix
    #./programs/syncthing.nix
    ./programs/themes.nix
  ];
}
