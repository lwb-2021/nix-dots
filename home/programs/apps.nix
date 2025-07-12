{ config, lib, pkgs, ... }: {
  home.packages = with pkgs;[
    qq
    wechat-uos
    wemeet


    calibre
    obsidian

    readest
  ];

  xdg.mimeApps.defaultApplications = {
    "x-scheme-handler/readest" = "readest.desktop";
  };
}
