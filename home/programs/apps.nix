{ config, lib, pkgs, ... }: {
  home.packages = with pkgs;[
    qq
    wechat 
    wemeet


    calibre
    obsidian

    readest
  ];

  xdg.mimeApps.defaultApplications = {
    "x-scheme-handler/readest" = "readest.desktop";
  };
  home.sessionVariables = {
    GIO_MODULE_DIR = "${pkgs.glib-networking}/lib/gio/modules/";
  };
}
