{ config, lib, pkgs, ... }: {
  xdg = {
    terminal-exec = {
      enable = true;
      settings.default = [
        "kitty.desktop"
      ];

    };
  };
}
