{ config, lib, pkgs, inputs, ... }: {
    home-manager.users.lwb = {
        imports = [ inputs.ags.homeManagerModules.default ];
        programs.ags = {
            enable = true;
            configDir = null;
            extraPackages = with pkgs; [
            ];
        };
        home.stateVersion = "25.05";
    };
}
