{
  config,
  lib,
  pkgs,
  ...
}:
{
  services.zerotierone = {
    # enable = true;
    joinNetworks = [
      "6ab565387a253314"
    ];

  };
  services.easytier = {
    enable = true;
    instances = {
      default = {
        enable = true;
        settings = {
          network_name = "722bf611-62c9-4b08-9128-1eff0b194b63";
          ipv4 = "10.126.126.0/24";
        };
      };
    };
  };

}
