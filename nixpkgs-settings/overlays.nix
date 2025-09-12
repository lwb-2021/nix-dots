{ inputs }:
[
  (final: prev: {
    nur = import inputs.nur {
      nurpkgs = prev;
      pkgs = prev;
    };
    stable = import inputs.nixpkgs-stable {
      localSystem = "x86_64-linux";
    };
    noCuda = import inputs.nixpkgs {
      localSystem = "x86_64-linux";
      config = {
        cudaSupport = false;
      };
    };
  })
  (final: prev: {
    inherit (final.lixPackageSets.stable)
      nixpkgs-review
      nix-eval-jobs
      nix-fast-build
      colmena
      ;
  })
  (final: prev: {
    wechat = prev.wechat.overrideAttrs {
      src = prev.fetchurl {
        url = "https://dldir1v6.qq.com/weixin/Universal/Linux/WeChatLinux_x86_64.AppImage";
        hash = "sha256-gBWcNQ1o1AZfNsmu1Vi1Kilqv3YbR+wqOod4XYAeVKo=";
      };
    };
  })
  (final: prev: {
  })
  inputs.nix-vscode-extensions.overlays.default
]
