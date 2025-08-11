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
        "{e2488817-3d73-4013-850d-b66c5e42d505}" = {
          enabled = true; 
          initialize = true; 
          menu = true; 
          ua = true; 
          windowLoc = true;
          autoSet = true;
          path = config.xdg.userDirs.download;
          protocol = "ws";
          host="127.0.0.1";
          port="6800";
          interf="jsonrpc";
          token="";
          sound="3";
        };
      };
    };
    profiles.default-bak = {
      id = 1145;
      isDefault = false;
    };
    profiles.default = {
      isDefault = true;
      extensions = {
        force = true;
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

          # Security
          noscript

          # Improvements
          ublock-origin
          redirector

          tampermonkey # Script
        ];
        settings = {
          "{3c078156-979c-498b-8990-85f7987dd929}".settings = {
            settings = {
              navBarLayout = "hidden";

              previewTabs = true;
              previewTabsMode = "p";
              previewTabsPageModeFallback = "n";

              snapLimit = 3;
              snapLimitUnit = "snap";

              pinnedNoUnload = false;

              syncUseFirefox = false;
            };
          };
        };
      };
      settings = {
        # 基础设置
        "extensions.autoDisableScopes" = 0;
        "extensions.activeThemeID" = "{32662a95-d1c0-40d9-b68b-aa682008c05c}";

        "font.language.group" = "zh-CN";
        "intl.locale.requested" = "zh-CN,en-US";

        # UI
        "browser.toolbars.bookmarks.visibility" = "always";
        "browser.uiCustomization.state" = ''{"placements":{"widget-overflow-fixed-list":[],"nav-bar":["_3c078156-979c-498b-8990-85f7987dd929_-browser-action","back-button","forward-button","stop-reload-button","customizableui-special-spring1","vertical-spacer","urlbar-container","customizableui-special-spring2","downloads-button","fxa-toolbar-menu-button","unified-extensions-button","zotero_chnm_gmu_edu-browser-action"],"toolbar-menubar":["menubar-items"],"vertical-tabs":[],"PersonalToolbar":["personal-bookmarks"]},"dirtyAreaCache":["unified-extensions-area","nav-bar","vertical-tabs","PersonalToolbar"],"currentVersion":22,"newElementCount":3}'';

        "media.autoplay.default" = 5;

        # 功能
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;

        # 优化
        "nglayout.initialpaint.delay" = 0;
      };

      search.default = "bing";
      search.engines = {
        nix-packages = {
          name = "Nix Packages";
          urls = [{
            template = "https://search.nixos.org/packages";
            params = [
              { name = "type"; value = "packages"; }
              { name = "query"; value = "{searchTerms}"; }
            ];
          }];

          icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = [ "@np" ];
        };

        nixos-wiki = {
          name = "NixOS Wiki";
          urls = [{ template = "https://wiki.nixos.org/w/index.php?search={searchTerms}"; }];
          iconMapObj."16" = "https://wiki.nixos.org/favicon.ico";
          definedAliases = [ "@nw" ];
        };
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
