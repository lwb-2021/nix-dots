{ config, pkgs, inputs,... }:{
  home.username = "lwb";
  home.homeDirectory = "/home/lwb";
  home.stateVersion = "25.05";
  xresources.properties = {
    "Xcursor.size" = 24;
    "Xft.dpi" = 153.6;
  };
  imports = [
    ./config/fish-user.nix
    ./config/i18n.nix
    ./config/mime.nix
    ./config/thunar.nix

    ./programs/desktop
    ./programs/development
    ./programs/media

    ./programs/apps.nix
    ./programs/aria2.nix
    ./programs/code.nix
    ./programs/firefox.nix
    ./programs/fonts.nix
    ./programs/kdeconnect.nix
    ./programs/keepassxc.nix
    ./programs/minecraft.nix
    ./programs/rime.nix
    ./programs/rofi.nix
    ./programs/syncthing.nix
    ./programs/themes.nix

    ./programs/development/python.nix
  ];
}
