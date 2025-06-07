{ pkgs, config, ... }: {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    theme = "~/.local/share/rofi/themes/rounded-purple-dark.rasi";
    terminal = "${pkgs.kitty}/bin/kitty";
    extraConfig = {
      show-icons = true;
      icon-theme = "BeautyLine";

      sidebar-mode = true;
      modes = "window,drun,run,ssh";
      kb-mode-next = "Tab";
      kb-element-next = "";
    };
  };

}
