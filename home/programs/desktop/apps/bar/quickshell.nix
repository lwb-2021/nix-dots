{ pkgs, inputs, ... }:
{
  home.packages = [
    inputs.quickshell.packages.${pkgs.system}.quickshell
  ];
  autostart.prepareCommands = [ "quickshell & sleep 1s" ];
}
