{ config, lib, pkgs, inputs, ... }: {
    home-manager.users.username = {
        imports = [ inputs.ags.homeManagerModules.default ];
        programs.ags = {
            enable = true;
        };

    };
    home.stateVersion = "25.05";
}
