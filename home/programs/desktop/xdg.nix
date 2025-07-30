{ config, lib, pkgs, ... }: {
  options = with lib;{
    autostart = {
      prepareCommands = mkOption {
        type = types.listOf types.lines;
      };
      commands = mkOption {
        type = types.listOf types.lines;
      };
    };
  };

  config = {
    xdg = {
      autostart.enable = true;
      mime.enable = true;
      mimeApps = {
        enable = true;
        defaultApplications = {
          "text/plain" = "nvim.desktop";
          "text/markdown" = "nvim.desktop";
          "inode/directory" = "thunar.desktop";
        };
      };
      portal = {
        enable = true;
        extraPortals = with pkgs; [
          xdg-desktop-portal
          xdg-desktop-portal-gtk
        ];
        config.common.default = "*";
      };
      userDirs = {
        enable = true;
        createDirectories = true;
      };
    };
    home.packages = with pkgs;[
      dex
    ];
    home.file.".config/autostart.sh" = {
      executable = true;
      text = let
        shebang = "#!/usr/bin/env bash";
        pre = lib.concatStringsSep "\n" config.autostart.prepareCommands;
        dex = "dex -a";
        post = lib.concatStringsSep "\n" config.autostart.commands;

      in
        lib.concatStringsSep "\n" [shebang pre dex post];
    };


  };


}
