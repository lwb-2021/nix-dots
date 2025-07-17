{ config, pkgs, lib, ... }: {
  imports = [ 
    ./colorscheme.nix
    ./keymaps.nix
    ./plugins

    ./lsp.nix
  ];
  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    clipboard.providers.wl-copy.enable = true;

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
