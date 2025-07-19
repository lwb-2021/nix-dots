{ pkgs, ... }: {
  programs.anki = {
    enable = true;
    addons = with pkgs.ankiAddons;[
      anki-connect
    ];
    language = "zh_CN";
    sync = {
      autoSync = true;
    };
  };
}
