{ pkgs, ... }@params:
{
  programs.lutris = {
    enable = true;
    defaultWinePackage = pkgs.proton-ge-bin;
    steamPackage = if params ? osConfig then params.osConfig.programs.steam.package else pkgs.steam;
  };

}
