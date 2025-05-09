{ config, lib, pkgs, ... }: {
    programs.steam = {
        enable = true;
        remotePlay.openFirewall = true; 
        dedicatedServer.openFirewall = true; 
        localNetworkGameTransfers.openFirewall = true; 
    };

    nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
        "steam"
        "steam-original"
        "steam-unwrapped"
        "steam-run"
        "xow_dongle-firmware"
    ];


    nixpkgs.config.allowUnfree = true;
    
    environment.systemPackages = with pkgs;[
        gamemode
        mangohud

    ];
    
    hardware.xone.enable = true; 
}
