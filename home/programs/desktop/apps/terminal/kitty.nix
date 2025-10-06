{ ... }:
{
  programs.kitty = {
    enable = true;
    settings = {
      cursor_trail = 3;
    };
  };
  wayland.terminal.exec = "kitty -1";
}
