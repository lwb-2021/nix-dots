{ pkgs, ... }:
{
  home.packages = with pkgs; [
    stable.anki
  ];
  # programs.anki = {
  #   enable = true;
  #   package = pkgs.stable.anki; # TODO: move anki to unstable after fixed
  #   # addons = with pkgs.ankiAddons; [
  #   #   anki-connect
  #   # ];
  #   language = "zh_CN";
  #   theme = "dark";
  #   style = "native";
  #   sync = {
  #     autoSync = true;
  #     autoSyncMediaMinutes = 120;
  #     username = "lwb-2021@qq.com";
  #     passwordFile = ./anki-pwd.txt;
  #   };
  # };

}
