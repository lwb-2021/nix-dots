{ inputs }:
[
  (final: prev: {
    nur = import inputs.nur {
      nurpkgs = prev;
      pkgs = prev;
    };
    noCuda = import inputs.nixpkgs {
      localSystem = "x86_64-linux";
      config = {
        cudaSupport = false;
      };
    };
  })
  (final: prev: {
  })
  (final: prev: {
  })
  inputs.nix-vscode-extensions.overlays.default
]
