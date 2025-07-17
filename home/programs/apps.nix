{ config, lib, pkgs, ... }@params: {
  home.packages = with pkgs;[
    qq
    (pkgs.makeDesktopItem {
      name = "WeChat";
      desktopName = "微信";
      exec = "wechat %U";
      terminal = false;
      icon = "wechat";
      type = "Application";
      categories = [ "Utility" ];
      comment = "微信桌面版";
    })
    (import ../../pkgs/wechat-pak.nix params)
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
