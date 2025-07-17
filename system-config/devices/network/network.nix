{ config, lib, pkgs, ... }: {
  networking = {
    hostName = "lwb";
    networkmanager.enable = true;
  };
}
