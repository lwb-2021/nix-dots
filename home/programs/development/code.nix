{ config, lib, pkgs, ... }: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    mutableExtensionsDir = false;
    profiles.default = {
      extensions = with pkgs.vscode-extensions;[
        mkhl.direnv

        bbenoist.nix

        ms-python.python
        ms-python.vscode-pylance

        ms-toolsai.jupyter
        ms-toolsai.vscode-jupyter-slideshow
        ms-toolsai.vscode-jupyter-cell-tags
        ms-toolsai.jupyter-renderers
        ms-toolsai.jupyter-keymap

        
        rust-lang.rust-analyzer

        tamasfe.even-better-toml



      ];
    };
  };

}
