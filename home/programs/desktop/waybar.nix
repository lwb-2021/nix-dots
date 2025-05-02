{ config, pkgs, ... }: {
    programs.waybar = {
        enable = true;
        settings = [
        {
            mainBar = {
                layer = "top";
                position = "top";
                height = 24;
                modules-left = [];
                modules-center = [ "clock" ];
                modules-right = [];
            };
        }

        ];

    };

}
