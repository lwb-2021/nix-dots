{ config, lib, pkgs, ... }: {
    boot = {
        kernelPackages = pkgs.linuxKernel.kernels.linux_zen;
        extraModulePackages = with config.boot.kernelPackages; [ nvidiaPackages.stable ];
    }; 

}
