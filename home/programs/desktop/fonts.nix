{ pkgs, config, ... }: { 
  home.packages = with pkgs;[
    source-han-sans
    nerd-fonts.jetbrains-mono
  ];
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      #serif = [ "" ];
      sansSerif = [ "Source Han Sans SC" ];
      monospace = [ "JetBrainsMono NF" ];
    };
  };
  
}
