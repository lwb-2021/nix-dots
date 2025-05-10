{ config, lib, pkgs, ... }: {
    xdg = {
        mime.enable = true;
        mimeApps = {
            defaultApplications = {
                "text/html" = "firefox.desktop";
                "x-scheme-handler/http" = "firefox.desktop";
                "x-scheme-handler/https" = "firefox.desktop";
                "x-scheme-handler/about" = "firefox.desktop";
                "x-scheme-handler/unknown" = "firefox.desktop";
                "application/pdf" = "firefox.desktop";


                "audio/mpeg" = "mpv.desktop";
                "audio/wav" = "mpv.desktop";
                "video/mpeg" = "mpv.desktop";
                "video/mp4" = "mpv.desktop";

                "text/plain" = "nvim.desktop";
                "text/markdown" = "nvim.desktop";
            };
        };
    };


} 
