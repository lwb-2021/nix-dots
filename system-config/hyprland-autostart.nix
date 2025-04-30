{ config, lib, pkgs, ... }: {
    programs.bash.loginShellInit = ''
        if [ -z "''${DISPLAY}" ] && [ "''${XDG_VTNR}" -eq 1 ]; then
            exec Hyprland
        fi
    '';
}
