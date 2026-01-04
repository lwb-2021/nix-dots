{
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./xdg.nix
    ./vars.nix
  ];

  options = with lib; {
    wayland.launcher.exec = mkOption {
      type = types.str;
    };
    wayland.screenshot.exec = mkOption {
      type = types.str;
    };
    wayland.terminal.exec = mkOption {
      type = types.str;
    };
  };
  config = {
  };

}
