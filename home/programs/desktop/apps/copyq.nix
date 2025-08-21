{ pkgs, ... }:
{
  home.packages = with pkgs; [
    copyq
  ];
  autostart.commands = [
    "copyq --start-server"
  ];

}
