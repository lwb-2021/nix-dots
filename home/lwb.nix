{ config, pkgs, inputs,... }:{
  home.username = "lwb";
  home.homeDirectory = "/home/lwb";
  home.stateVersion = "25.05";
  xresources.properties = {
    "Xcursor.size" = 24;
    "Xft.dpi" = 153.6;
  };
  programs.git = {
    userName = "lwb";
    userEmail = "lwb-2021@qq.com";
  };
  imports = [
    ./config/fish-user.nix
    ./config/i18n.nix
    ./config/mime.nix
    ./config/thunar.nix



    ./programs/media

    ./programs/apps.nix

    ./programs/compatibility/wine.nix

    ./programs/desktop
    ./programs/desktop/ags
    ./programs/desktop/hypr
    ./programs/desktop/apps/kitty.nix
    ./programs/desktop/apps/nomacs.nix
    ./programs/desktop/apps/rofi.nix
    ./programs/desktop/fonts.nix
    ./programs/desktop/rime.nix
    ./programs/desktop/themes.nix

    ./programs/development
    ./programs/development/code.nix
    ./programs/development/python.nix
    ./programs/development/git.nix

    ./programs/game/lutris.nix
    ./programs/game/minecraft.nix

    ./programs/network/aria2.nix
    ./programs/network/chat.nix
    ./programs/network/firefox.nix
    ./programs/network/kdeconnect.nix
    ./programs/network/syncthing.nix

    ./programs/research/office.nix
    ./programs/research/pandoc.nix
    ./programs/research/zotero.nix

    ./programs/security/keepassxc.nix

    ./programs/system/pay-respect.nix
    ./programs/system/yazi.nix
  ];
  programs.home-manager.enable = true;
}
