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
  ];
  xdg.dataFile."passage/extensions".source = pkgs.symlinkJoin {
    name = "passage-extensions";
    paths = with pkgs.passExtensions; [ pass-otp ];
    stripPrefix = "/lib/password-store/extensions";
    failOnMissing = true;
  };
}
