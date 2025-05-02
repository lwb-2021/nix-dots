{ config, pkgs, ... }: {
    programs.waybar = {
        enable = true;
        settings = [
            {
                layer = "top";
                position = "top";
                height = 24;
                modules-left = [];
                modules-center = [  ];
                modules-right = [  "tray" "clock" ];
            }

        ];

    };
}
