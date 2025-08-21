{ pkgs, ... }:
{
  programs.nixvim.plugins = {
    alpha = import ./ui/alpha.nix;
    bufferline = import ./ui/bufferline.nix;
    neogit = import ./ui/neogit.nix;
    nvim-tree = import ./ui/nvim-tree.nix;

    comment = import ./editing/comment.nix;
    nvim-autopairs = import ./editing/autopairs.nix;

    cmp = import ./cmp/cmp.nix;
    cmp-ai = import ./cmp/cmp-ai.nix;

    treesitter = import ./highlight/treesitter.nix pkgs;
    web-devicons.enable = true;

    rainbow-delimiters = import ./highlight/rainbow-delimiters.nix;

    which-key = import ./which-key.nix;
  };
}
