{ config, ... }:
{
  sops = {
    age.keyFile = "${config.xdg.configHome}/sops/age/keys.txt";
    defaultSopsFile = ../../secrets/lwb/home-secrets.yaml;
    secrets = {
      "rclone/crypt/password" = { };
      "rclone/jianguoyun/password" = { };
      "rclone/openlist/password" = { };
      "restic/password" = { };
      "anki/password" = { };
      "vicinae/nix/github-token" = { };
    };
  };

}
