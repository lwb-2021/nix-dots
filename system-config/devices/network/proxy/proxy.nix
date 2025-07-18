{ config, lib, pkgs, ... }: {
  services.mihomo = {
    enable = true;
    tunMode = true;
    configFile = ./mihomo-config.yaml;
  };
  environment.persistence."/nix/persistence" = {
    directories = [

    ];

  };
  environment.systemPackages = with pkgs;[
    sparkle
  ];
  services.tor = {
    enable = true;
    client.enable = true;
    settings = {
      UseBridges = true;
      ClientTransportPlugin = "webtunnel exec ${pkgs.obfs4}/bin/lyrebird";
      Bridge = import ./bridges.nix;
    };
  };
}
