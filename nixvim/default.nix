{ config, pkgs, lib, ... }: {
  imports = [ 
    ./colorscheme.nix
    ./plugins

    ./lsp.nix
  ];
  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    opts = {
      tabstop = 2;
      softtabstop = 2;
      shiftwidth = 2;
      expandtab = true;

      number = true;
      cursorline = true;
      termguicolors = true;
      showmode = false;
    };


  };
}
