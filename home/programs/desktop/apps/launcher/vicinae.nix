{ pkgs, inputs, ... }:
{
  services.vicinae = {
    enable = true;
    systemd.autoStart = true;
    settings = {
      theme = {
        # name = "vicinae-dark";
        iconTheme = "BeautyLine";
      };
      window = {
        csd = true;
        rounding = 10;
      };

      faviconService = "twenty";
    };
    extensions = with inputs.vicinae-extensions.packages.${pkgs.stdenv.hostPlatform.system}; [
      bluetooth
      firefox
      niri
      nix
      player-pilot
      process-manager
      wifi-commander
    ];
  };
  wayland.launcher.exec = "vicinae toggle";
}
