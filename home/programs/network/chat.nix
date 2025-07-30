{ config, lib, pkgs, ... }: {
  programs.element-desktop = {
    enable = true;
    settings = {
    };

  };
  autostart.commands = [
    "element-desktop --hidden &"
  ];

}
