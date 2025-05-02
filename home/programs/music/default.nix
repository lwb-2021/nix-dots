{ config, lib, pkgs, ... }: {
    imports = [
        ./mpd.nix
        ./ncmpcpp.nix
    ];
}
