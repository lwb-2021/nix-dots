{ config, lib, pkgs, ... }: {
  wayland.windowManager.hyprland = {
    settings = {
      windowrule = [
        "float, title:.*正在.*"
        #"size 400 200, title:.*正在.*"
        "move 100%-w-20 80, title:.*正在.*"

        "float, class:org.kde.kdeconnect.handler"
        "center, class:org.kde.kdeconnect.handler"
        
        "float, class:(waydroid)(.*)"
        "noblur, class:(waydroid)(.*)"

        "float, title:(扩展： (Aria2 下载器集成组件))(.*)"
        
        "opacity 0.9, class:^(kitty)$"
      ];
    };
  };
}
