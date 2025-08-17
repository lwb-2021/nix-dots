{ pkgs, ... }: { 
  i18n = { 
    inputMethod = { 
      enable = true; 
      type = "fcitx5"; 
      fcitx5 = { 
        addons = with pkgs;[
          fcitx5-gtk
          fcitx5-rime
          (catppuccin-fcitx5.overrideAttrs {
            preInstall = "bash ./enable-rounded.sh";
          })
        ]; 
        waylandFrontend = true; 
        settings = {
          globalOptions = {
            Hotkey = {
              EnumerateWithTriggerKeys = true;
              "TriggerKeys/0" = "Alt+Shift+Shift_R";
            };
          };
          addons = { 
            classicui.globalSection = {
              Theme = "catppuccin-mocha-mauve";
              DarkTheme = "catppuccin-mocha-mauve"; 
            };
          };
        };
      };
    };
  };
}
