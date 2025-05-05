{ config, lib, pkgs, ... }: {
    imports = [
        ./mpd.nix
        ./mpris.nix
        ./ncmpcpp.nix

        ./mpv.nix
    ];
}
