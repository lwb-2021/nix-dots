{ pkgs, ... }: {

  enable = true;
  grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [

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
