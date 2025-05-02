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
    services.mpd-mpris = {
        enable = true;
        mpd.useLocal = true;
    };
    home.packages = with pkgs;[
        mpc
    ];
}
