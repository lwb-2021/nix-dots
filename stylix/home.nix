{ config, ... }:
{
  stylix.targets = {
    firefox.enable = false;
    qt = {
      enable = true;
      platform = "qtct";
    };
    gtk = {
      colors.override = with config.lib.stylix.colors; {
        base0E = base0D;
        base0D = base0E; # apply gtk accent to Base0D
      };
      flatpakSupport.enable = true;
    };
  };
}
