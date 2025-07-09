{ config, lib, pkgs, ... }: {
  programs.zellij = {
    enable = true;
    attachExistingSession = true;
    enableFishIntegration = true;
    settings = {
      theme = "tokyo-night-dark";
      show_startup_tips = false;     
    };
  };

}
