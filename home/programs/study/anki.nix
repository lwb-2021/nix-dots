{ config, pkgs, ... }: rec {
  programs.anki = {
    enable = true;
    addons = with pkgs.ankiAddons;[
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
