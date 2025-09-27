{
  config,
  lib,
  pkgs,
  ...
}@params:
{
  home.packages = with pkgs; [
    (import ../../pkgs/wechat-pak.nix params)
    (import ../../pkgs/qq-pak.nix params)
    (import ../../pkgs/dingtalk-pak.nix params)
    (pkgs.makeDesktopItem {
      name = "com.tencent.wechat";
      desktopName = "WeChat";
      genericName = "wechat";
      categories = [ "Network" "Chat" ];
      keywords = [ "wechat" ];
      icon = "wechat";
      exec = "wechat %U";
      startupNotify = true;
      extraConfig = {
        "Name[zh_CN]" = "微信";
      };
    })
     (pkgs.makeDesktopItem {
      name = "com.tencent.qq";
      desktopName = "QQ";
      genericName = "qq";
      categories = [ "Network" "Chat" ];
      keywords = [ "qq" ];
      icon = "qq";
      exec = "qq %U";
      startupNotify = true;
    })   

    wemeet

    obsidian

  ];

  xdg.mimeApps.defaultApplications = {
    "x-scheme-handler/readest" = "readest.desktop";
  };
  home.sessionVariables = {
    GIO_MODULE_DIR = "${pkgs.glib-networking}/lib/gio/modules/";
  };
}
