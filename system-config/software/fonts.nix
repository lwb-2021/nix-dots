{ pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      source-han-sans
      nerd-fonts.jetbrains-mono
      nur.repos.rewine.ttf-wps-fonts
    ];
    fontconfig = {
      enable = true;
      defaultFonts = {
        #serif = [ "" ];
        sansSerif = [ "Source Han Sans SC" ];
        monospace = [ "JetBrainsMono NF" ];
      };
    };

  };

}
