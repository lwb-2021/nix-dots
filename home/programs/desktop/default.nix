{ config, pkgs, ... }: {
    imports = [
        ./hyprland
        ./hyprlock.nix
        ./ags
    ];
    home.packages = with pkgs;[
        mako
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
