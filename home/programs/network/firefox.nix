{ config, pkgs, inputs, ... }: {
  programs.firefox = {
    enable = true;
    languagePacks = ["en-US" "zh-CN"];
    policies = {};
    profiles.default = {
      id = 0;
      name = "default";
      isDefault = true;
    };
    profiles.lwb = {
      name = "lwb";
      packages = with inputs.nur.legacyPackages.${pkgs.system}.repos.rycee.firefox-addons; [
        # Downloader
        aria2-integration
        single-file

        auto-tab-discard # Performance

        # UI
        darkreader
        sidebery

        # Connector
        keepassxc-browser
        zotero-connector

        # Improvements
        ublock-origin
        redirector

        tampermonkey # Script
      ];
      settings = {
        toolkit.legacyUserProfileCustomizations.stylesheets = true;
        extensions.autoDisableScopes = 0;
      };

      userChrome = ''
      #TabsToolbar {
        display: none !important;
      }
      #sidebar-splitter {
        opacity: 0 !important;
        min-width: 1px !important;
        background-color: transparent !important;
        border: none !important;
      }
      '';
    };
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
