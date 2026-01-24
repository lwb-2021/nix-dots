{
  config,
  lib,
  pkgs,
  ...
}:
{
  sops.age.keyFile = "/var/lib/sops-nix/keys.txt";
  sops.defaultSopsFile = ../../secrets/lwb/system-secrets.yaml;
  # Or
  # fileSystems."/etc/ssh".neededForBoot = true;

  environment.systemPackages = [ pkgs.sops ];
  sops.secrets = {
    "easytier/default/secret-env" = { };
  };
}
