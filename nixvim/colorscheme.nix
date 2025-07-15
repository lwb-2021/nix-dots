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
            italic = true;
          };
          sidebars = "dark";
          variables = { };
        };
      };
    };
  };
}
