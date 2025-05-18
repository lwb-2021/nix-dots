{ config, lib, pkgs, ... }:{
    xdg.configFile = {
        "xfce4/helpers.rc".text = ''
            TerminalEmulator=kitty    
        '';
    };
    xdg.dataFile = {
        "Thunar/sendto/kdeconnect-thunar.desktop".source = "${pkgs.plasma5Packages.kdeconnect-kde}/share/Thunar/sendto/kdeconnect-thunar.desktop";
    };
}
