{ config, lib, pkgs, ... }: {
  services.gnome-keyring = {
    enable = true;
    components = [ "pkcs11" "secrets" ];
  };
  home.packages = with pkgs;[
    keyutils
    seahorse
  ];
}
