{
  config,
  lib,
  pkgs,
  ...
}@params:
{
  home.packages = with pkgs; [
    qq
    (import ../../pkgs/wechat-pak.nix params)
    (import ../../pkgs/dingtalk-pak.nix params)

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
