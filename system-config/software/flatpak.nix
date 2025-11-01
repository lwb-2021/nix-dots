{ config, pkgs, ... }:
{
  services.flatpak.enable = true;
  system.fsPackages = [ pkgs.bindfs ];

  fileSystems =
    let
      mkRoSymBind = path: {
        device = path;
        fsType = "fuse.bindfs";
        options = [
          "ro"
          "resolve-symlinks"
          "x-gvfs-hide"
        ];
      };
      aggregated = pkgs.buildEnv {
        name = "system-fonts-and-icons";
        paths =
          config.fonts.packages
          ++ (with pkgs; [
            phinger-cursors
            beauty-line-icon-theme
            # Add your cursor themes and icon packages here
            # etc.
          ]);
        pathsToLink = [
          "/share/fonts"
          "/share/icons"
        ];
      };
    in
    {
      "/usr/share/fonts" = mkRoSymBind "${aggregated}/share/fonts";
      "/usr/share/icons" = mkRoSymBind "${aggregated}/share/icons";
    };

  fonts.packages = with pkgs; [
    source-han-sans
    nerd-fonts.jetbrains-mono
  ];
}
