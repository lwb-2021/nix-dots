{ config, pkgs, lib, ... }: {
    home.packages = with pkgs;[xorg.xrdb];
    wayland.windowManager.hyprland.settings = {
        monitor = ", highres, auto, 1.6";

        # unscale XWayland
        xwayland = {
            force_zero_scaling = true;
        };

        # toolkit-specific scale
        exec-once = [
            "echo 'Xft.dpi: 154' | xrdb -merge"
        ];

    };   
}
