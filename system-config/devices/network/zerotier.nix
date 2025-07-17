{ config, lib, pkgs, ... }: {
  services.zerotierone = {
    enable = true;
    joinNetworks = [
      "6ab565387a253314"
    ];

  };


}
