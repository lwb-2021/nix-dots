{
  config,
  lib,
  pkgs,
  ...
}:
{
  #sops.age.keyFile = "/nix/persistence/var/lib/sops-nix/key.txt";
  # Or
  # fileSystems."/etc/ssh".neededForBoot = true;
  environment.systemPackages = [ pkgs.sops ];
  sops.secrets = {
  };
}
