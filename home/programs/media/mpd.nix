{ config, lib, pkgs, ... }: {
    services.mpd = {
        enable = true;
        extraConfig = ''
            audio_output {
                type "pipewire"
                name "PipeWire Output"
            }
        '';
    };
    home.packages = with pkgs;[
        mpc
    ];
}
