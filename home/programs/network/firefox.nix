{ config, lib, pkgs, ... }: {
  programs.firefox = {
    enable = true;
    languagePacks = ["en-US" "zh-CN"];
    policies = {

    };
    #profiles.default = {};
  };
  xdg.mimeApps.defaultApplications = {
    "text/html" = "firefox.desktop";
    "x-scheme-handler/http" = "firefox.desktop";
    "x-scheme-handler/https" = "firefox.desktop";
    "x-scheme-handler/about" = "firefox.desktop";
    "x-scheme-handler/unknown" = "firefox.desktop";
    "application/pdf" = "firefox.desktop";
  };
}
