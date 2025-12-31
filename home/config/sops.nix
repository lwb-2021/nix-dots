{ config, ... }:
{
  sops = {
    age.keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt";
    defaultSopsFile = ../../secrets/home-secrets.yaml;
    secrets = {
      "rclone/crypt/password" = { };
      "rclone/jianguoyun/password" = { };
    };
  };

}
