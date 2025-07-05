{ config, lib, pkgs, ... }: {
  programs.zellij = {
    enable = true;
    attachExistingSession = true;
    enableFishIntegration = true;
    settings = {
      theme = "tokyo-night-dark";
    };
  };

}
