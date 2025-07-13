{ config, lib, pkgs, ... }: {
  programs.zellij = {
    enable = true;
    attachExistingSession = true;
    exitShellOnExit = false;
    enableFishIntegration = true;
    settings = {
      theme = "tokyo-night-dark";
      show_startup_tips = false;     
    };
  };

}
