{ config, lib, pkgs, ... }: {
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; 
    dedicatedServer.openFirewall = true; 
    localNetworkGameTransfers.openFirewall = true; 
  };
  services.sunshine = {
    enable = true;
    autoStart = true;
    capSysAdmin = true;
    openFirewall = true;

  };


  environment.systemPackages = with pkgs;[
    mangohud

  ];

  programs.gamemode.enable = true;

  hardware.xone.enable = true; 
}
