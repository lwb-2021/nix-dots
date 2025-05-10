{ config, lib, pkgs, inputs, ... }: {
    home-manager.users.lwb = {
        imports = [ inputs.ags.homeManagerModules.default ];
        programs.ags = {
            enable = true;
            configDir = null;
            extraPackages = with inputs.ags.packages.${pkgs.system};[
                battery
                mpris
                tray
                hyprland
                notifd
                network
                bluetooth
                powerprofiles
                wireplumber
            ];
        };
        home.stateVersion = "25.05";
    };
}
