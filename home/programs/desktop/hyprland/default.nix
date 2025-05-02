{ config, pkgs, lib, ... }: {
    imports = [
        ./autostart.nix
        ./effects.nix
        ./environment.nix
        ./keymap.nix
    ];
    wayland.windowManager.hyprland = {
        enable = true;
        package = null;
    };

}
