{ config, lib, pkgs, pkgs-native, ... }: {
  boot = {
    kernelPackages = pkgs-native.linuxPackages_zen;
    extraModulePackages = with config.boot.kernelPackages; [ nvidiaPackages.stable v4l2loopback];
  }; 

}
