{
  pkgs,
  inputs,
  ...
}:
{
  imports = [ inputs.ags.homeManagerModules.default ];
  programs.ags = {
    enable = true;
    systemd.enable = true;
    configDir = null;
    extraPackages = with inputs.ags.packages.${pkgs.system}; [
      apps
      battery
      mpris
      tray
      hyprland
      notifd
      network
      bluetooth
      powerprofiles
      wireplumber
    ];
  };
}
