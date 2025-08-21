{
  config,
  lib,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    nixos-artwork.wallpapers.stripes-logo
  ];
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      preload = [
        "${pkgs.nixos-artwork.wallpapers.stripes-logo}/share/backgrounds/nixos/nix-wallpaper-stripes-logo.png"
      ];
      wallpaper = [
        ", ${pkgs.nixos-artwork.wallpapers.stripes-logo}/share/backgrounds/nixos/nix-wallpaper-stripes-logo.png"
      ];
    };
  };
}
