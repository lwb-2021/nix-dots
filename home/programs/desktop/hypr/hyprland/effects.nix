{ config, pkgs, lib, ... }: {
    wayland.windowManager.hyprland = {
        settings = {
            decoration = {
                rounding = 20;
            };
        };
    };

}
