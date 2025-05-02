{ config, pkgs, ... }: {
    imports = [
        ./hyprland
        ./thunar.nix
        ./waybar.nix
    ];
    home.packages = with pkgs;[
        mako

        xfce.thunar
        xarchiver
    ];

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
