{ pkgs, ... }:
{
  programs.anki = {
    enable = true;
    package = pkgs.anki.override {
      python3Packages = pkgs.python312Packages;
    };
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
