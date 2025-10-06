{ ... }:
{
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      config.unix_domains = {
        {
        name = "unix",
        },
      }
      config.default_gui_startup_args = { "connect", "unix" }
    '';
  };
  autostart.commands = [ "wezterm-mux-server --daemonize" ];
  wayland.terminal.exec = "wezterm";
}
