{ ... }:
{
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      local wezterm = require 'wezterm'
      local config = wezterm.config_builder()

      config.unix_domains = {
        {
          name = "unix",
        },
      }
      config.default_gui_startup_args = { "connect", "unix" }
      return config
    '';
  };
  autostart.commands = [ "wezterm-mux-server --daemonize" ];
  wayland.terminal.exec = "wezterm";
}
