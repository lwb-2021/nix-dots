{ pkgs, ... }:
{
  imports = [
    ./gnupg.nix
    ./keepassxc.nix
    ./keyring.nix
  ];
  programs.password-store = {
    enable = true;
    package = pkgs.pass.withExtensions (exts: [ exts.pass-otp ]);
  };
}
