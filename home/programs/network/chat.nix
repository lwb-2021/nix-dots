{
  config,
  lib,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    fluffychat
  ];
  autostart.commands = [
    # "element-desktop --hidden &"
  ];

}
