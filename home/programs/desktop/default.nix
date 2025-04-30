{ config, pkgs, ... }: {
    imports = [
        ./hyprland
    ];
    home.packages = with pkgs;[
        mako

        xfce.thunar
        xarchiver
    ];
    


    programs.waybar = {
        enable = true;
        settings = [
        {
            mainBar = {
                layer = "top";
                position = "top";
                height = 24;
                modules-left = [];
                modules-center = [];
                modules-right = [];
            };
        }

        ];

    };
    xdg = {
        portal = {
            enable = true;
            extraPortals = with pkgs; [
                xdg-desktop-portal
                xdg-desktop-portal-gtk
            ];
            config.common.default = "*";
        };
        userDirs = {
            enable = true;
            createDirectories = true;
        };
    };

}
