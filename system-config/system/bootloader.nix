{ pkgs, ... }: {
  boot = {
    tmp.useTmpfs = true;
    loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };
      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
        extraEntries = ''
                menuentry "Windows"{
                    search --file --no-floppy --set=root /EFI/Microsoft/Boot/bootmgfw.efi
                        chainloader (''${root})/EFI/Microsoft/Boot/bootmgfw.efi
                }
        '';
        theme = pkgs.catppuccin-grub.override { flavor = "mocha"; };
        gfxmodeEfi = "1920x1080";
      };
    };
  };
}
