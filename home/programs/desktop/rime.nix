{ pkgs, ... }:
{
  i18n = {
    inputMethod = {
      enable = true;
      type = "fcitx5";
      fcitx5 = {
        addons = with pkgs; [
          fcitx5-gtk
          fcitx5-rime
        ];
        waylandFrontend = true;
        settings = {
          globalOptions = {
            Hotkey = {
              EnumerateWithTriggerKeys = true;
              "TriggerKeys/0" = "Alt+Shift+Shift_R";
            };
          };
        };
      };
    };
  };
}
