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
    package = pkgs.passage;
    settings = {
      PASSAGE_IDENTITIES_FILE = "${config.xdg.configHome}/sops/age/keys.txt";
    };
  };

  home.packages = with pkgs; [
    pass-git-helper
    passExtensions.pass-otp
  ];
}
