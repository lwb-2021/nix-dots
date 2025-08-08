{ ... }: {
  wayland.windowManager.hyprland.settings = {
    general.layout = "scrolling";
    plugin.hyprscrolling = {
      fullscreen_on_one_column = true;
      focus_fit_method = 1;
    };
  };
}
