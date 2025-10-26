{
  config,
  lib,
  pkgs,
  ...
}@params:
{
  /*
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
  */
  services.flatpak = {
    enable = true;
    remotes = [
      {
        name = "flathub";
        location = "https://mirrors.sjtu.edu.cn/flathub";
        gpg-import = "${pkgs.fetchurl {
          url = "https://mirror.sjtu.edu.cn/flathub/flathub.gpg";
          hash = "sha256-i9wgq8ThnAeWRgvrW/4OeqQThxaZnhnG8tvdeMxBrqo=";
        }}";
      }
    ];
    packages = [

      "com.github.tchx84.Flatseal"

      "com.tencent.WeChat"
      "com.qq.QQ"
      "com.tencent.wemeet"
      "com.dingtalk.DingTalk"

      "md.obsidian.Obsidian"
    ];
  };

  xdg.mimeApps.defaultApplications = {
    "x-scheme-handler/readest" = "readest.desktop";
  };
  home.sessionVariables = {
    GIO_MODULE_DIR = "${pkgs.glib-networking}/lib/gio/modules/";
  };
}
