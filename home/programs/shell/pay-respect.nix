{ config, lib, pkgs, ... }: {
  programs.pay-respects = {
    enable = true;
    
  };
  programs.nix-index = {
    enable = true;
  };
}
