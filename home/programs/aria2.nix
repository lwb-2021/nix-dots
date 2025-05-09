{ config, lib, pkgs, ... }: {
    programs.aria2 = {
        enable = true;
        #package = pkgs.aria2.overrideAttrs (finalAttrs: previousAttrs: { patches = previousAttrs.patches + [ ./aria2c-fast.patch ]; });
        settings = {
            
        };
    };

}
