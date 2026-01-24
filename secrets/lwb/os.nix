{
  config,
  lib,
  pkgs,
  ...
}:
{
  sops.age.keyFile = "/var/lib/sops-nix/keys.txt";
  sops.defaultSopsFile = ./files/os.yaml;
  # Or
  # fileSystems."/etc/ssh".neededForBoot = true;

  environment.systemPackages = [ pkgs.sops ];
  sops.secrets = {
    "easytier/default/secret-env" = { };
  };
}
