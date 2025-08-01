{ pkgs, ... }: {
  programs.adb.enable = true;
  users.users.lwb.extraGroups = [ "adbusers" ];
  virtualisation.waydroid.enable = true;
  services.udev.extraRules = ''
    SUBSYSTEMS=="usb", ATTRS{idVendor}=="05c6", ATTRS{idProduct}=="9006", MODE="0666", GROUP="plugdev"

    # Qualcomm Memory Debug
    SUBSYSTEMS=="usb", ATTRS{idVendor}=="05c6", ATTRS{idProduct}=="900E", MODE="0666", GROUP="plugdev"

    # LG Memory Debug
    SUBSYSTEMS=="usb", ATTRS{idVendor}=="1004", ATTRS{idProduct}=="61a1", MODE="0666", GROUP="plugdev"

    # Sierra Wireless
    SUBSYSTEMS=="usb", ATTRS{idVendor}=="1199", ATTRS{idProduct}=="9071", MODE="0666", GROUP="plugdev"
  '';
}
