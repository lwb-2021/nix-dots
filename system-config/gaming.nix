{ config, lib, pkgs, ... }: {
    nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
        "steam"
        "steam-original"
        "steam-unwrapped"
        "steam-run"
        "xow_dongle-firmware"
    ];


    programs.steam = {
        enable = true;
        package = pkgs.steam.override {
            #withPrimus = true;
        };
        remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
        dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
        localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
    };
    environment.systemPackages = with pkgs;[
        gamemode
        mangohud

    ];
    
    hardware.xone.enable = true; # support for the xbox controller USB dongle
}
