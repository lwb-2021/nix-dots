{ config, pkgs, lib, ... }: {
    imports = [
        ./autostart.nix
        ./display.nix
        ./effects.nix
        ./environment.nix
        ./keymap.nix
        ./rules.nix
    ];
    wayland.windowManager.hyprland = {
        enable = true;
        package = null;
    };

}
