{ pkgs, ... }:
{
  enable = true;
  grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
    python
    rust

    nix
  ];
  settings = {
    indent = {
      enable = true;
    };

    highlight = {
      enable = true;
    };
  };
}
