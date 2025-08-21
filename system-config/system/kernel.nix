{
  config,
  lib,
  pkgs,
  ...
}:
{
  boot = {
    kernelPackages = pkgs.linuxPackages_zen;
    extraModulePackages = with config.boot.kernelPackages; [
      nvidiaPackages.stable
      v4l2loopback
    ];
  };

}
