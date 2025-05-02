{ config, lib, pkgs, ... }: {
    home.packages = with pkgs;[
        qq
    ];
    nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
        "qq"
    ];
}
