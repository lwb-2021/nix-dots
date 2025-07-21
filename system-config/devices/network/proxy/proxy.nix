{ config, lib, pkgs, ... }: {
  services.mihomo = {
    enable = true;
    tunMode = true;
    webui = pkgs.metacubexd;
    configFile = ./mihomo-config.yaml;
  };
  environment.persistence."/nix/persistence" = {
    directories = [

    ];

  };
  environment.systemPackages = [
    (pkgs.makeDesktopItem {
      desktopName = "Mihomo WebUI";
      name = "mihomo-webui";
      url = "http://127.0.0.1:9090/ui/#";
      icon = "preferences-system-network-proxy";
      type = "Link";
    })

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
