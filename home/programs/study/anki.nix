{ config, pkgs, ... }: {
  programs.anki = {
    enable = true;
    addons = with pkgs.ankiAddons;[
      anki-connect
    ];
    language = "zh_CN";
    style = "native";
    sync = {
      autoSync = true;
      autoSyncMediaMinutes = 120;
      username = "lwb-2021@qq.com";
      passwordFile = config.sops.templates."anki-pwd.txt".path;
    };
  };
}
