{ pkgs, ... }:
{
  xdg.dataFile = {
    "Thunar/sendto/kdeconnect-thunar.desktop".source =
      "${pkgs.kdePackages.kdeconnect-kde}/share/Thunar/sendto/kdeconnect-thunar.desktop";
  };
  data.local.directories = [
    ".cache/thumbnails"
  ];
}
