{ config, lib, pkgs, ... }: {
    wayland.windowManager.hyprland = {
        settings = {
            windowrule = [
                "float, title:.*正在.*"
                #"size 400 200, title:.*正在.*"
                "move 100%-w-20 20, title:.*正在.*"
            ];
        };
    };
}
