{
  config,
  lib,
  pkgs,
  ...
}:
{
  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      AllowUsers = [ "lwb" ];
      UseDns = true;
      X11Forwarding = false;
    };
  };

  users.users."lwb".openssh.authorizedKeys.keys = [
    # note: ssh-copy-id will add user@your-machine after the public key
    # but we can remove the "@your-machine" part
  ];

  programs.ssh = {
    startAgent = true;
  };

  networking.firewall.allowedTCPPorts = [ 22 ];

}
