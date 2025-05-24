{ config, lib, pkgs, ... }: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    profiles.default = {
      extensions = with pkgs.vscode-extensions;[
        bbenoist.nix

        ms-python.python
        ms-python.vscode-pylance

        ms-toolsai.jupyter
        ms-toolsai.vscode-jupyter-slideshow
        ms-toolsai.vscode-jupyter-cell-tags
        ms-toolsai.jupyter-renderers
        ms-toolsai.jupyter-keymap



      ];
    };
  };

}
