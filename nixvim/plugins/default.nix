{ pkgs, ... }: {
  programs.nixvim.plugins = {
    bufferline = import ./bufferline.nix;

    cmp = import ./cmp.nix;

    neogit = import ./neogit.nix;

    nvim-tree = import ./nvim-tree.nix;

    treesitter = import ./treesitter.nix pkgs;
    web-devicons.enable = true;


    rainbow-delimiters = import ./rainbow-delimiters.nix;

    which-key = import ./which-key.nix;
  };
}
