{ pkgs, ... }:
{
  programs.regreet = {
    enable = true;
    settings = {
    };
  };

  programs.niri = {
    enable = true;
    useNautilus = false;
  };

  security.polkit = {
    enable = true;
  };
  security.soteria.enable = true;

  security.pam.services = {
    hyprlock.enable = true;
    login.enableGnomeKeyring = true;
  };
  services.gnome.gcr-ssh-agent.enable = false;

  # Thunar

  programs.thunar = {
    enable = true;
    plugins = with pkgs; [
      thunar-archive-plugin
    ];
  };
  programs.xfconf.enable = true;
  services.gvfs = {
    enable = true;
  };
  services.tumbler.enable = true;
  environment.systemPackages = with pkgs; [
    xfce4-exo
    xarchiver

    wl-clipboard-rs

    ffmpegthumbnailer
  ];

}
