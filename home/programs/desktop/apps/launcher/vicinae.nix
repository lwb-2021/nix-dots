{ pkgs, inputs, ... }:
{
  services.vicinae = {
    enable = true;
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

      providers = {
        "@knoopx/nix-0" = {
          preferences = {
            githubToken = (import ../../../../../secrets.nix).githubToken.nixpkgsPRTracker;
          };
        };
        clipboard = {
          preferences = {
            encryption = true;
          };
        };
      };
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
  autostart.commands = [ "vicinae server" ];
}
