{ config, lib, pkgs, ... }: {
  programs.nixvim.colorschemes = {
    kanagawa = {
      enable = true;
    };
  };
}
