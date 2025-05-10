{ config, lib, pkgs, ... }: {
    programs.steam = {
        enable = true;
        remotePlay.openFirewall = true; 
        dedicatedServer.openFirewall = true; 
        localNetworkGameTransfers.openFirewall = true; 
    };

    environment.systemPackages = with pkgs;[
        mangohud

    ];

    programs.gamemode.enable = true;
    
    hardware.xone.enable = true; 
}
