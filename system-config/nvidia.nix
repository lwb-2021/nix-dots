{ config, lib, pkgs, ... }:
{
    hardware.graphics = {
        enable = true;
    };
    services.xserver.videoDrivers = ["nvidia"];
        hardware.nvidia = {
        modesetting.enable = true;

        powerManagement.enable = true; # false

        powerManagement.finegrained = true; # false

        open = true;

        nvidiaSettings = true;

        package = config.boot.kernelPackages.nvidiaPackages.stable;
        prime = {
            offload = {
                enable = true;
                enableOffloadCmd = true;
            };
            intelBusId = "PCI:0:2:0";
            nvidiaBusId = "PCI:1:0:0";
        };
    };

}
