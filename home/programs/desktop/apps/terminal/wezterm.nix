{ pkgs, inputs, ... }:
{
  programs.wezterm = {
    enable = true;
    package = inputs.wezterm.packages.${pkgs.system}.default;
    extraConfig = ''
      local wezterm = require 'wezterm'
      local config = wezterm.config_builder()

      config.font_size = 12
      config.font = wezterm.font_with_fallback({
        { family = "JetBrainsMono NF", weight = "Medium", italic = false },
        { family = "Source Han Sans SC", weight = "Medium", italic = false },
      })

      -- config.initial_cols = 110
      -- config.initial_rows = 30

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
