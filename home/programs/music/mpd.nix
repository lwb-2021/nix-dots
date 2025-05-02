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
    services.mpdris2 = {
        enable = true;
        multimediaKeys = true;
    };
    home.packages = with pkgs;[
        mpc
    ];
}
