{ config, pkgs, lib, ... }: {
    wayland.windowManager.hyprland = {
        systemd = {
            variables = ["--all"];
        };
        settings = {
            env = [];
        };
    };

}
