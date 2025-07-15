{ config, lib, pkgs, ... }: {
  programs.nixvim.colorschemes = {
    tokyonight = {
      enable = true;
      settings = {
        style = "night";
        styles = {
          comments = {
            italic = true;
          };
          floats = "dark";
          functions = { };
          keywords = {
            bold = true;
            fg = "#9d7cd8";
          };
          sidebars = "dark";
          variables = { };
        };
      };
    };
  };
}
