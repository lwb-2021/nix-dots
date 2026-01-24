{
  pkgs,
  ...
}:
{
  programs.gpg = {
    enable = true;
  };
  services.gpg-agent = {
    enable = true;
    enableFishIntegration = true;
    pinentry.package = pkgs.pinentry-all;
  };
  home.packages = with pkgs; [
    age
  ];
}
