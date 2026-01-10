{ ... }:
{
  programs.atuin = {
    enable = true;
    forceOverwriteSettings = true;
    daemon = {
      enable = true;
    };
    flags = [ "--disable-up-arrow" ];

  };
}
