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
        base0E-hex = base0D-hex;
        base0D-hex = base0E-hex; # apply gtk accent to Base0D
      };

      flatpakSupport.enable = true;
    };
  };
}
