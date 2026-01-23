{ lib, pkgs, ... }:
{
  boot = {
    tmp.useTmpfs = true;
    loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };
      limine = {
        enable = true;
        efiSupport = true;
        extraEntries = ''
          /Windows 11
              protocol: efi_chainload
              path: boot():/EFI/Microsoft/Boot/bootmgfw.efi
        '';
      };

    };
    initrd = {
      systemd = {
        enable = true;
      };
    };
  };

}
