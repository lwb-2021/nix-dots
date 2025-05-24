{ config, lib, pkgs, ... }: {
    imports = [
        ./hyprlock.nix
        ./hyprpaper.nix
        ./hyprland
    ];
}
