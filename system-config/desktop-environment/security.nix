{ ... }:
{

  security.polkit = {
    enable = true;
  };
  security.pam.services = {
    hyprlock.enable = true;
    login.enableGnomeKeyring = true;
  };
  services.gnome.gnome-keyring = {
    enable = true;
  };
}
