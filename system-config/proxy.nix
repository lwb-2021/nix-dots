{ config, lib, pkgs, ... }: {
    services.v2raya = {
        enable = true;
    };
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
