{ config, pkgs, ... }:
{
  imports = [
    ./enc-tools.nix
    ./ssh.nix
    ./keepassxc.nix
    ./keyring.nix
  ];
  programs.password-store = {
    enable = true;
    package = pkgs.pass.withExtensions (
      ps: with ps; [
        pass-otp
        pass-import
        pass-update
      ]
    );
    settings = {
      PASSWORD_STORE_DIR = "${config.home.homeDirectory}/.local/share/password-store";
    };
  };

  home.packages = with pkgs; [
    pass-git-helper
  ];
  data.local.directories = [
    ".local/share/password-store"
  ];
}
