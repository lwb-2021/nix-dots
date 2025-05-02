{ config, lib, pkgs, ... }: {
    boot = {
        kernelPackages = pkgs.linuxKernel.kernels.linux_zen;
    }; 
    hardware.nvidia.package = lib.mkForce pkgs.linuxKernel.packages.linux_zen.nvidia_x11_latest_open;

}
