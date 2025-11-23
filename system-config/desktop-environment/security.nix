{ ... }:
{

  security.polkit = {
    enable = true;
  };
  security.pam.services = {
    hyprlock.enable = true;
    login.enableGnomeKeyring = true;
  };
}
