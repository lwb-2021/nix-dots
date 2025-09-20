{ pkgs, ... }:
{
  home.packages = with pkgs;[
    pkgs.stable.anki
  ];
  programs.anki = {
    # enable = true; 
    # TODO wait for pr 438958 to be merged
    addons = with pkgs.ankiAddons; [
      anki-connect
    ];
    language = "zh_CN";
    theme = "dark";
    style = "native";
    sync = {
      autoSync = true;
      autoSyncMediaMinutes = 120;
      username = "lwb-2021@qq.com";
      passwordFile = ./anki-pwd.txt;
    };
  };

}
