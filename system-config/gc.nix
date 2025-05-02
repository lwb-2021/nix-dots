{ config, lib, pkgs, ... }:{
    boot.loader.grub.configurationLimit = 4;

    # do garbage collection weekly to keep disk usage low
    nix.gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 1w";
    };

    # Optimise storage
    # you can also optimise the store manually via:
    #    nix-store --optimise
    # https://nixos.org/manual/nix/stable/command-ref/conf-file.html#conf-auto-optimise-store
    nix.settings.auto-optimise-store = true;

}
