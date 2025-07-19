{ config, pkgs, ... }: {
  programs.firefox = {
    enable = true;
    languagePacks = [ "zh-CN" "en-US" ];
    policies = {
      ExtensionSettings = {
        "{32662a95-d1c0-40d9-b68b-aa682008c05c}" = {
          installation_mode = "normal_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/file/4101199/minimalist_dark_and_purple_tab-3.0.xpi";
          private_browsing = true;
        };
      };
    };
    profiles.default = {
      id = 1;
      name = "default";
      isDefault = true;
    };
    profiles.lwb = {
      name = "lwb";
      isDefault = false;
      extensions = {
        packages = with pkgs.nur.repos.rycee.firefox-addons; [
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
      };
      settings = {

        "app.normandy.first_run" = false;

        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "extensions.autoDisableScopes" = 0;

        "font.language.group" = "zh-CN";
        "intl.accept_languages" = "zh-CN, zh, zh-TW, zh-HK, en-US, en";

        "browser.toolbars.bookmarks.visibility" = "always";
        
        "media.autoplay.default" = 5;
      };

      userChrome = ''
      #TabsToolbar {
        display: none !important;
      }
      #sidebar-box[sidebarcommand="_3c078156-979c-498b-8990-85f7987dd929_-sidebar-action"] #sidebar-header {
        visibility: collapse !important;
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
