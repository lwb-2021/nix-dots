{ config, lib, pkgs, ... }: {

    services.getty.autologinUser = "lwb"; 
    programs.fish.loginShellInit = ''
        bash -c 'if [ -z "''${DISPLAY}" ] && [ "''${XDG_VTNR}" -eq 1 ]; then
            exec Hyprland
        fi'
    '';
}
