{ config, lib, pkgs, inputs, ... }: {
    imports = [
        ./hyprlock.nix
        ./hyprpaper.nix
        ./hyprland
    ];
}
