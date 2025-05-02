{ config, lib, pkgs, inputs, ... }: {
    imports = [ags.homeManagerModules.default];
    programs.ags = {
        enable = true;
    };
}
