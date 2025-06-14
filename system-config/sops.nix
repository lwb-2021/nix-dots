{ config, lib, pkgs, ... }: {
  # sops.age.keyFile = "/nix/persist/var/lib/sops-nix/key.txt";
  # Or
  # fileSystems."/etc/ssh".neededForBoot = true;
  environment.systemPackages = [ pkgs.sops ];
  sops.secrets = {
    
  };
}
