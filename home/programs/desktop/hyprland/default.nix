{ config, pkgs, lib, ... }: {
    imports = [
        ./autostart.nix
        ./display.nix
        ./effects.nix
        ./environment.nix
        ./keymap.nix
    ];
    wayland.windowManager.hyprland = {
        enable = true;
        package = null;
        plugins = with pkgs;[
            hyprlandPlugins.hyprexpo
        ];
    };

}
