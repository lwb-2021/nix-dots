{ ... }:
{

  security.polkit = {
    enable = true;
  };
  security.pam.services = {
    hyprlock.enable = true;
    login.enableGnomeKeyring = true;
  };
  services.gnome.gcr-ssh-agent.enable = false;
}
