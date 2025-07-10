{ config, pkgs, inputs, ... }: {
  imports = [
    ./xdg.nix
  ];
  home.packages = with pkgs;[
    mako
    xarchiver
  ];

 
}
