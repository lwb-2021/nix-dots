{ ... }: {
  zramSwap = {
    enable = true;
    writebackDevice = "/dev/disk/by-uuid/ff5a2b4e-a5b6-4c72-a05e-2d41b02f1794";
    priority = 10;
    memoryPercent = 100;
  };
  boot.kernel.sysctl = {
    "vm.swappiness" = 180;
    "vm.watermark_boost_factor" = 0;
    "vm.watermark_scale_factor" = 125;
    "vm.page-cluster" = 0;
  };
}
