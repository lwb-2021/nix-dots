{ pkgs, ... }: {
  programs.nixvim.plugins = {
    alpha = import ./alpha.nix;

    bufferline = import ./bufferline.nix;

    cmp = import ./cmp.nix;
    cmp-ai = import ./cmp-ai.nix;

    neogit = import ./neogit.nix;

    nvim-tree = import ./nvim-tree.nix;

    treesitter = import ./treesitter.nix pkgs;
    web-devicons.enable = true;

    rainbow-delimiters = import ./rainbow-delimiters.nix;

    which-key = import ./which-key.nix;
  };
}
